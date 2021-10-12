// region spotinst/ocean-eks

variable "spotinst_token" {
  type        = string
  description = "Spot Personal Access token"
}

variable "spotinst_account" {
  type        = string
  description = "Spot account ID"
}

variable "update_policy" {
  type = object({
    should_roll           = bool
    batch_size_percentage = number
    launch_spec_ids       = list(string)
  })
  description = "Configures the cluster update policy"
  default     = null
}

// endregion
