// region terraform-aws-modules/eks

variable "cluster_enabled_log_types" {
  type        = list(string)
  description = "A list of the desired control plane logging to enable. For more information, see Amazon EKS Control Plane Logging documentation (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)"
  default     = []
}

variable "cluster_log_kms_key_id" {
  type        = string
  description = "If a KMS Key ARN is set, this key will be used to encrypt the corresponding log group. Please be sure that the KMS Key has an appropriate key policy (https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/encrypt-log-data-kms.html)"
  default     = ""
}

variable "cluster_log_retention_in_days" {
  type        = number
  description = "Number of days to retain log events. Default retention - 90 days"
  default     = 90
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources"
  default     = null
}

variable "cluster_security_group_id" {
  type        = string
  description = "If provided, the EKS cluster will be attached to this security group. If not given, a security group will be created with necessary ingress/egress to work with the workers"
  default     = ""
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version to use for the EKS cluster"
  default     = "1.18"
}

variable "kubeconfig_output_path" {
  type        = string
  description = "Where to save the Kubectl config file (if `write_kubeconfig = true`). Assumed to be a directory if the value ends with a forward slash `/`"
  default     = "./"
}

variable "kubeconfig_file_permission" {
  type        = string
  description = "File permission of the Kubectl config file containing cluster configuration saved to `kubeconfig_output_path.`"
  default     = "0600"
}

variable "write_kubeconfig" {
  type        = bool
  description = "Whether to write a Kubectl config file containing the cluster configuration. Saved to `kubeconfig_output_path`"
  default     = true
}

variable "manage_aws_auth" {
  description = "Whether to apply the aws-auth configmap file"
  default     = true
}

variable "aws_auth_additional_labels" {
  type        = map(string)
  description = "Additional kubernetes labels applied on aws-auth ConfigMap"
  default     = {}
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap. See examples/basic/variables.tf for example format"
  type        = list(string)
  default     = []
}

variable "map_roles" {
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  description = "Additional IAM roles to add to the aws-auth configmap. See examples/basic/variables.tf for example format"
  default     = []
}

variable "map_users" {
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  description = "Additional IAM users to add to the aws-auth configmap. See examples/basic/variables.tf for example format"
  default     = []
}

variable "subnets" {
  type        = list(string)
  description = "A list of subnets to place the EKS cluster and workers within"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources. Tags added to launch configuration or templates override these values for ASG Tags only"
  default     = {}
}

variable "vpc_id" {
  type        = string
  description = "VPC where the cluster and workers will be deployed"
  default     = null
}

variable "worker_groups" {
  type        = any
  description = "A list of maps defining worker group configurations to be defined using AWS Launch Configurations. See workers_group_defaults for valid keys"
  default = [ // Create a dummy worker group to allow IAM resources to be created (ref: https://git.io/JklBL).
    {
      asg_desired_capacity = 0
      asg_max_size         = 0
      asg_min_size         = 0
    }
  ]
}

variable "workers_group_defaults" {
  type        = any
  description = "Override default values for target groups. See workers_group_defaults_defaults in local.tf for valid keys"
  default     = {}
}

variable "worker_groups_launch_template" {
  type        = any
  description = "A list of maps defining worker group configurations to be defined using AWS Launch Templates. See workers_group_defaults for valid keys"
  default     = []
}

variable "worker_security_group_id" {
  type        = string
  description = "If provided, all workers will be attached to this security group. If not given, a security group will be created with necessary ingress/egress to work with the EKS cluster"
  default     = ""
}

variable "worker_ami_name_filter" {
  type        = string
  description = "Name filter for AWS EKS worker AMI. If not provided, the latest official AMI for the specified 'cluster_version' is used"
  default     = ""
}

variable "worker_ami_name_filter_windows" {
  type        = string
  description = "Name filter for AWS EKS Windows worker AMI. If not provided, the latest official AMI for the specified 'cluster_version' is used"
  default     = ""
}

variable "worker_ami_owner_id" {
  type        = string
  description = "The ID of the owner for the AMI to use for the AWS EKS workers. Valid values are an AWS account ID, 'self' (the current account), or an AWS owner alias (e.g. 'amazon', 'aws-marketplace', 'microsoft')"
  default     = "amazon"
}

variable "worker_ami_owner_id_windows" {
  type        = string
  description = "The ID of the owner for the AMI to use for the AWS EKS Windows workers. Valid values are an AWS account ID, 'self' (the current account), or an AWS owner alias (e.g. 'amazon', 'aws-marketplace', 'microsoft')"
  default     = "amazon"
}

variable "worker_additional_security_group_ids" {
  type        = list(string)
  description = "A list of additional security group ids to attach to worker instances"
  default     = []
}

variable "worker_sg_ingress_from_port" {
  type        = number
  description = "Minimum port number from which pods will accept communication. Must be changed to a lower value if some pods in your cluster will expose a port lower than 1025 (e.g. 22, 80, or 443)"
  default     = 1025
}

variable "workers_additional_policies" {
  type        = list(string)
  description = "Additional policies to be added to workers"
  default     = []
}

variable "kubeconfig_aws_authenticator_command" {
  type        = string
  description = "Command to use to fetch AWS EKS credentials"
  default     = "aws-iam-authenticator"
}

variable "kubeconfig_aws_authenticator_command_args" {
  type        = list(string)
  description = "Default arguments passed to the authenticator command. Defaults to [token -i $cluster_name]"
  default     = []
}

variable "kubeconfig_aws_authenticator_additional_args" {
  type        = list(string)
  description = "Any additional arguments to pass to the authenticator such as the role to assume. e.g. [\"-r\", \"MyEksRole\"]"
  default     = []
}

variable "kubeconfig_aws_authenticator_env_variables" {
  type        = map(string)
  description = "Environment variables that should be used when executing the authenticator. e.g. { AWS_PROFILE = \"eks\"}"
  default     = {}
}

variable "kubeconfig_name" {
  type        = string
  description = "Override the default name used for items kubeconfig"
  default     = ""
}

variable "cluster_create_timeout" {
  type        = string
  description = "Timeout value when creating the EKS cluster"
  default     = "30m"
}

variable "cluster_delete_timeout" {
  type        = string
  description = "Timeout value when deleting the EKS cluster"
  default     = "15m"
}

variable "cluster_create_security_group" {
  type        = bool
  description = "Whether to create a security group for the cluster or attach the cluster to `cluster_security_group_id`"
  default     = true
}

variable "worker_create_security_group" {
  type        = bool
  description = "Whether to create a security group for the workers or attach the workers to `worker_security_group_id`"
  default     = true
}

variable "worker_create_initial_lifecycle_hooks" {
  type        = bool
  description = "Whether to create initial lifecycle hooks provided in worker groups"
  default     = false
}

variable "worker_create_cluster_primary_security_group_rules" {
  type        = bool
  description = "Whether to create security group rules to allow communication between pods on workers and pods using the primary cluster security group"
  default     = false
}

variable "permissions_boundary" {
  type        = string
  description = "If provided, all IAM roles will be created with this permissions boundary attached"
  default     = null
}

variable "iam_path" {
  type        = string
  description = "If provided, all IAM roles will be created on this path"
  default     = "/"
}

variable "cluster_create_endpoint_private_access_sg_rule" {
  type        = bool
  description = "Whether to create security group rules for the access to the Amazon EKS private API server endpoint"
  default     = false
}

variable "cluster_endpoint_private_access_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks which can access the Amazon EKS private API server endpoint"
  default     = null
}

variable "cluster_endpoint_private_access" {
  type        = bool
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled"
  default     = false
}

variable "cluster_endpoint_public_access" {
  type        = bool
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint"
  default     = ["0.0.0.0/0"]
}

variable "manage_cluster_iam_resources" {
  type        = bool
  description = "Whether to let the module manage cluster IAM resources. If set to false, cluster_iam_role_name must be specified"
  default     = true
}

variable "cluster_iam_role_name" {
  type        = string
  description = "IAM role name for the cluster. Only applicable if manage_cluster_iam_resources is set to false"
  default     = ""
}

variable "manage_worker_iam_resources" {
  type        = bool
  description = "Whether to let the module manage worker IAM resources. If set to false, iam_instance_profile_name must be specified for workers"
  default     = true
}

variable "workers_role_name" {
  type        = string
  description = "User defined workers role name"
  default     = ""
}

variable "attach_worker_cni_policy" {
  type        = bool
  description = "Whether to attach the Amazon managed `AmazonEKS_CNI_Policy` IAM policy to the default worker IAM role. WARNING: If set `false` the permissions must be assigned to the `aws-node` DaemonSet pods via another method or nodes will not be able to join the cluster"
  default     = true
}

variable "create_eks" {
  type        = bool
  description = "Controls whether EKS resources should be created (it affects almost all resources)"
  default     = true
}

variable "node_groups_defaults" {
  type        = any
  description = "Map of values to be applied to all node groups. See `node_groups` module's documentation for more details"
  default     = {}
}

variable "node_groups" {
  type        = any
  description = "Map of map of node groups to create. See `node_groups` module's documentation for more details"
  default     = {}
}

variable "enable_irsa" {
  type        = bool
  description = "Whether to create OpenID Connect Provider for EKS to enable IRSA"
  default     = false
}

variable "eks_oidc_root_ca_thumbprint" {
  type        = string
  description = "Thumbprint of Root CA for EKS OIDC, Valid until 2037"
  default     = "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"
}

variable "cluster_encryption_config" {
  type = list(object({
    provider_key_arn = string
    resources        = list(string)
  }))
  description = "Configuration block with encryption configuration for the cluster. See examples/secrets_encryption/main.tf for example format"
  default     = []
}

variable "fargate_profiles" {
  type        = any
  description = "Fargate profiles to create. See `fargate_profile` keys section in fargate submodule's README.md for more details"
  default     = {}
}

variable "create_fargate_pod_execution_role" {
  type        = bool
  description = "Controls whether the EKS Fargate pod execution IAM role should be created"
  default     = true
}

variable "fargate_pod_execution_role_name" {
  type        = string
  description = "The IAM Role that provides permissions for the EKS Fargate Profile"
  default     = null
}

// endregion

// region terraform-aws-modules/vpc

variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  description = "Should be true if you want only one NAT Gateway per availability zone"
  type        = bool
  default     = false
}

variable "reuse_nat_ips" {
  description = "Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external_nat_ip_ids' variable"
  type        = bool
  default     = false
}

variable "external_nat_ip_ids" {
  description = "List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse_nat_ips)"
  type        = list(string)
  default     = []
}

// endregion

// region spotinst/ocean-eks

variable "spotinst_token" {
  type        = string
  description = "Spot Personal Access token"
}

variable "spotinst_account" {
  type        = string
  description = "Spot account ID"
}

variable "cluster_identifier" {
  type        = string
  description = "Cluster identifier"
  default     = null
}

variable "ami_id" {
  type        = string
  description = "The image ID for the EKS worker nodes. If none is provided, Terraform will search for the latest version of their EKS optimized worker AMI based on platform"
  default     = null
}

variable "worker_user_data" {
  type        = string
  description = "User data to pass to worker node instances. If none is provided, a default Linux EKS bootstrap script is used"
  default     = null
}

variable "root_volume_size" {
  type        = string
  description = "The size (in GiB) to allocate for the root volume"
  default     = null
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

variable "whitelist" {
  type        = list(string)
  description = "List of instance types allowed in the Ocean cluster (`whitelist` and `blacklist` are mutually exclusive)"
  default     = null
}

variable "blacklist" {
  type        = list(string)
  description = "List of instance types not allowed in the Ocean cluster (`whitelist` and `blacklist` are mutually exclusive)"
  default     = null
}

variable "create_ocean" {
  type        = bool
  description = "Controls whether Ocean should be created (it affects all Ocean resources)"
  default     = true
}

variable "spot_percentage" {
  type        = number
  description = "Sets the percentage of nodes that should be Spot (vs On-Demand) in the cluster"
  default     = 100
}

variable "autoscaler_is_enabled" {
  type        = bool
  description = "Controls whether Ocean Auto Scaler should be enabled"
  default     = true
}

variable "autoscaler_is_auto_config" {
  type        = bool
  description = "Controls whether Ocean Auto Scaler should be auto configured"
  default     = true
}

variable "autoscaler_headroom_percentage" {
  type        = number
  description = "Sets the auto headroom percentage (a number in the range [0, 200]) which controls the percentage of headroom from the cluster. Relevant only when `autoscale_is_auto_config` toggled on"
  default     = null
}

variable "autoscaler_headroom_cpu_per_unit" {
  type        = number
  description = "Configures the number of CPUs to allocate the headroom (CPUs are denoted in millicores, where 1000 millicores = 1 vCPU)"
  default     = null
}

variable "autoscaler_headroom_gpu_per_unit" {
  type        = number
  description = "Configures the number of GPUs to allocate the headroom"
  default     = null
}

variable "autoscaler_headroom_memory_per_unit" {
  type        = number
  description = "Configures the amount of memory (MB) to allocate the headroom"
  default     = null
}

variable "autoscaler_headroom_num_of_units" {
  type        = number
  description = "Sets the number of units to retain as headroom, where each unit has the defined headroom CPU and memory"
  default     = null
}

variable "autoscaler_cooldown" {
  type        = number
  description = "Sets cooldown period between scaling actions"
  default     = null
}

variable "autoscaler_max_scale_down_percentage" {
  type        = number
  description = "Sets the maximum percentage (a number in the range [1, 100]) to scale down"
  default     = null
}

variable "autoscaler_resource_limits_max_vcpu" {
  type        = number
  description = "Sets the maximum cpu in vCPU units that can be allocated to the cluster"
  default     = null
}

variable "autoscaler_resource_limits_max_memory_gib" {
  type        = number
  description = "Sets the maximum memory in GiB units that can be allocated to the cluster"
  default     = null
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

// region spotinst/ocean-controller

variable "controller_image" {
  type        = string
  description = "Set the Docker image name for the Ocean Controller that should be deployed"
  default     = "gcr.io/spotinst-artifacts/kubernetes-cluster-controller"
}

variable "controller_node_selector" {
  type        = map(string)
  description = "Specifies the node selector which must match a node's labels for the Ocean Controller resources to be scheduled on that node"
  default     = null
}

variable "image_pull_policy" {
  type        = string
  description = "Image pull policy (one of: Always, Never, IfNotPresent)"
  default     = "Always"
}

// endregion
