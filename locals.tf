locals {
  subnets = (
    var.subnets != null
    ? var.subnets
    : module.vpc.private_subnets
  )

  vpc_id = (
    var.vpc_id != null
    ? var.vpc_id
    : module.vpc.vpc_id
  )

  ami_id = (
    var.ami_id != null
    ? var.ami_id
    : module.eks.workers_default_ami_id
  )

  cluster_name = (
    var.cluster_name != null
    ? var.cluster_name
    : "ocean-${random_string.suffix.result}"
  )

  ocean_cluster_id = (
    var.create_ocean
    ? element(concat(spotinst_ocean_aws.this.*.id, [""]), 0)
    : null
  )

  ocean_controller_id = (
    var.cluster_identifier != null
    ? var.cluster_identifier
    : module.eks.cluster_id
  )

  worker_user_data = (
    var.worker_user_data != null
    ? var.worker_user_data
    : <<-EOF
    #!/bin/bash
    set -o xtrace
    /etc/eks/bootstrap.sh ${local.cluster_name}
EOF
  )
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}
