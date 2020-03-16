provider "aws" {
  region = var.region
}

provider "spotinst" {
  token   = var.spotinst_token
  account = var.spotinst_account
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  load_config_file       = false
}

locals {
  cluster_name = "ocean-${random_string.suffix.result}"
  tags         = {}
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_management"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.168.0.0/16",
    ]
  }
}

resource "aws_iam_role" "workers" {
  name_prefix           = local.cluster_name
  assume_role_policy    = data.aws_iam_policy_document.workers_assume_role_policy.json
  force_detach_policies = true
}

resource "aws_iam_instance_profile" "workers" {
  name_prefix = local.cluster_name
  role        = aws_iam_role.workers.name
}

resource "aws_iam_role_policy_attachment" "workers_AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.workers.name
}

resource "aws_iam_role_policy_attachment" "workers_AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.workers.name
}

resource "aws_iam_role_policy_attachment" "workers_AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.workers.name
}

resource "spotinst_ocean_aws" "this" {
  depends_on = [module.eks]

  name                        = var.cluster_name
  controller_id               = var.cluster_identifier != null ? var.cluster_identifier : module.eks.cluster_id
  region                      = var.region
  max_size                    = var.max_size
  min_size                    = var.min_size
  desired_capacity            = var.desired_capacity
  subnet_ids                  = module.vpc.private_subnets
  image_id                    = var.ami_id != null ? var.ami_id : module.eks.workers_default_ami_id
  security_groups             = [aws_security_group.all_worker_mgmt.id, module.eks.worker_security_group_id]
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = aws_iam_instance_profile.workers.arn

  user_data = <<-EOF
    #!/bin/bash
    set -o xtrace
    /etc/eks/bootstrap.sh ${local.cluster_name}
EOF

  tags {
    key   = "Name"
    value = "${local.cluster_name}-ocean-cluster-node"
  }
  tags {
    key   = "kubernetes.io/cluster/${local.cluster_name}"
    value = "owned"
  }

  autoscaler {
    autoscale_is_enabled     = true
    autoscale_is_auto_config = true
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.29.0"

  name               = local.cluster_name
  cidr               = "10.0.0.0/16"
  azs                = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1], data.aws_availability_zones.available.names[2]]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  tags = merge(
    local.tags,
    {
      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    },
  )
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "10.0.0"

  cluster_name    = local.cluster_name
  cluster_version = var.cluster_version
  subnets         = module.vpc.private_subnets
  tags            = local.tags
  vpc_id          = module.vpc.vpc_id
  map_roles = [
    {
      rolearn  = aws_iam_role.workers.arn
      username = "system:node:{{EC2PrivateDNSName}}"
      groups   = ["system:nodes"]
    },
  ]

  worker_additional_security_group_ids = [aws_security_group.all_worker_mgmt.id]
}

# TODO(liran): Replace with `ocean-controller` module as soon as
# https://github.com/hashicorp/terraform/issues/10462 is resolved.
resource "null_resource" "controller_installation" {
  depends_on = [module.eks, spotinst_ocean_aws.this]

  provisioner "local-exec" {
    command = <<EOT
      if [ ! -z ${var.spotinst_account} -a ! -z ${var.spotinst_token} ]; then
        echo "Downloading controller configmap"
        curl -L https://spotinst-public.s3.amazonaws.com/integrations/kubernetes/cluster-controller/templates/spotinst-kubernetes-controller-config-map.yaml -o configmap.yaml
        sed -i -e "s@<TOKEN>@${var.spotinst_token}@g" configmap.yaml
        sed -i -e "s@<ACCOUNT_ID>@${var.spotinst_account}@g" configmap.yaml
        sed -i -e "s@<IDENTIFIER>@${spotinst_ocean_aws.this.controller_id}@g" configmap.yaml
        echo "Applying controller configmap"
        kubectl --kubeconfig=${module.eks.kubeconfig_filename} apply -f configmap.yaml
        echo "Applying controller resources"
        kubectl --kubeconfig=${module.eks.kubeconfig_filename} apply -f https://s3.amazonaws.com/spotinst-public/integrations/kubernetes/cluster-controller/spotinst-kubernetes-cluster-controller-ga.yaml
      fi
    EOT
  }
}
