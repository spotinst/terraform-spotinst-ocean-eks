resource "spotinst_ocean_aws" "this" {
  count      = var.create_ocean ? 1 : 0
  depends_on = [module.eks]

  name                        = local.cluster_name
  controller_id               = local.ocean_controller_id
  region                      = data.aws_region.current.id
  max_size                    = var.max_size
  min_size                    = var.min_size
  desired_capacity            = var.desired_capacity
  subnet_ids                  = local.subnets
  image_id                    = local.ami_id
  root_volume_size            = var.root_volume_size
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  whitelist                   = var.whitelist
  blacklist                   = var.blacklist
  iam_instance_profile        = element(concat(module.eks.worker_iam_instance_profile_arns, [""]), 0)
  user_data                   = <<-EOF
    #!/bin/bash
    set -o xtrace
    /etc/eks/bootstrap.sh ${local.cluster_name}
EOF

  security_groups = flatten([
    module.eks.worker_security_group_id,
    var.worker_additional_security_group_ids,
  ])

  tags {
    key   = "Name"
    value = local.cluster_name
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

module "ocean-controller" {
  source     = "spotinst/ocean-controller/spotinst"
  version    = "~> 0.28"
  depends_on = [module.eks]

  create_controller  = var.create_ocean
  spotinst_token     = var.spotinst_token
  spotinst_account   = var.spotinst_account
  controller_image   = var.controller_image
  image_pull_policy  = var.image_pull_policy
  cluster_identifier = local.ocean_controller_id
}
