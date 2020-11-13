variable "spotinst_token" {
  type        = string
  description = "Spot Personal Access token"
}

variable "spotinst_account" {
  type        = string
  description = "Spot account ID"
}

variable "region" {
  type        = string
  description = "The region the EKS cluster will be located"
  default     = null
}

variable "cluster_identifier" {
  type        = string
  description = "Cluster identifier"
  default     = null
}

variable "cluster_name" {
  type        = string
  description = "Cluster name"
  default     = null
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes supported version"
  default     = "1.18"
}

variable "subnets" {
  type        = list(string)
  description = "A list of subnets to place the EKS cluster and workers within"
  default     = null
}

variable "vpc_id" {
  type        = string
  description = "VPC where the cluster and workers will be deployed"
  default     = null
}

variable "ami_id" {
  type        = string
  description = "The image ID for the EKS worker nodes. If none is provided, Terraform will search for the latest version of their EKS optimized worker AMI based on platform"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "min_size" {
  type        = number
  description = "The lower limit of worker nodes the Ocean cluster can scale down to"
  default     = null
}

variable "max_size" {
  type        = number
  description = "The upper limit of worker nodes the Ocean cluster can scale up to"
  default     = null
}

variable "desired_capacity" {
  type        = number
  description = "The number of worker nodes to launch and maintain in the Ocean cluster"
  default     = 1
}

variable "key_name" {
  type        = string
  description = "The key pair to attach to the worker nodes launched by Ocean"
  default     = null
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address to worker nodes"
  default     = false
}

variable "create_ocean" {
  type        = bool
  description = "Controls whether Ocean should be created (it affects all Ocean resources)"
  default     = true
}
