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
  spot_percentage             = var.spot_percentage
  iam_instance_profile        = element(concat(module.eks.worker_iam_instance_profile_arns, [""]), 0)
  user_data                   = local.worker_user_data

  security_groups = flatten([
    module.eks.worker_security_group_id,
    var.worker_additional_security_group_ids,
  ])

  autoscaler {
    autoscale_is_enabled     = var.autoscaler_is_enabled
    autoscale_is_auto_config = var.autoscaler_is_auto_config
    autoscale_cooldown       = var.autoscaler_cooldown
    auto_headroom_percentage = var.autoscaler_headroom_percentage

    dynamic "autoscale_headroom" {
      for_each = (
        var.autoscaler_is_enabled &&
        var.autoscaler_headroom_cpu_per_unit != null &&
        var.autoscaler_headroom_memory_per_unit != null &&
        var.autoscaler_headroom_num_of_units != null &&
        var.autoscaler_headroom_gpu_per_unit != null
      ) ? [1] : []
      content {
        cpu_per_unit    = var.autoscaler_headroom_cpu_per_unit
        gpu_per_unit    = var.autoscaler_headroom_gpu_per_unit
        memory_per_unit = var.autoscaler_headroom_memory_per_unit
        num_of_units    = var.autoscaler_headroom_num_of_units
      }
    }

    dynamic "autoscale_down" {
      for_each = (
        var.autoscaler_is_enabled &&
        var.autoscaler_max_scale_down_percentage != null
      ) ? [1] : []
      content {
        max_scale_down_percentage = var.autoscaler_max_scale_down_percentage
      }
    }

    dynamic "resource_limits" {
      for_each = (
        var.autoscaler_is_enabled &&
        var.autoscaler_resource_limits_max_vcpu != null &&
        var.autoscaler_resource_limits_max_memory_gib != null
      ) ? [1] : []
      content {
        max_vcpu       = var.autoscaler_resource_limits_max_vcpu
        max_memory_gib = var.autoscaler_resource_limits_max_memory_gib
      }
    }
  }

  dynamic "update_policy" {
    for_each = var.update_policy != null ? [var.update_policy] : []
    content {
      should_roll = update_policy.value.should_roll
      roll_config {
        batch_size_percentage = update_policy.value.batch_size_percentage
        launch_spec_ids       = update_policy.value.launch_spec_ids
      }
    }
  }

  tags {
    key   = "Name"
    value = local.cluster_name
  }

  tags {
    key   = "kubernetes.io/cluster/${local.cluster_name}"
    value = "owned"
  }

  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }
}

module "ocean-controller" {
  source     = "spotinst/ocean-controller/spotinst"
  version    = "~> 0.35"
  depends_on = [module.eks]

  create_controller   = var.create_ocean
  spotinst_token      = var.spotinst_token
  spotinst_account    = var.spotinst_account
  disable_auto_update = var.controller_disable_auto_update
  controller_image    = var.controller_image
  node_selector       = var.controller_node_selector
  image_pull_policy   = var.image_pull_policy
  resources_limits    = var.controller_resource_limits
  resources_requests  = var.controller_resources_requests
  cluster_identifier  = local.ocean_controller_id
}
