variable "spotinst_token" {
  type        = string
  description = "Spotinst Personal Access token"
}

variable "spotinst_account" {
  type        = string
  description = "Spotinst account ID"
}

variable "cluster_name" {
  type        = string
  description = "Cluster name"
}

variable "region" {
  type        = string
  description = "The region the EKS cluster will be located"
}

variable "min_size" {
  type        = number
  description = "The lower limit of worker nodes the Ocean cluster can scale down to"
}

variable "max_size" {
  type        = number
  description = "The upper limit of worker nodes the Ocean cluster can scale up to"
}

variable "desired_capacity" {
  type        = number
  description = "The number of worker nodes to launch and maintain in the Ocean cluster"
}
