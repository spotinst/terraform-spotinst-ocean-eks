# Spot Ocean EKS Terraform Module

A Terraform module to create an [Amazon Elastic Kubernetes Service (EKS)](https://aws.amazon.com/eks) cluster with [Spot Ocean](https://spot.io/products/ocean). The module will install the Ocean Controller into the cluster.

## Table of Contents

- [Usage](#usage)
- [Prerequisites](#prerequisites)
- [Examples](#examples)
- [Resources](#resources)
- [Requirements](#requirements)
- [Providers](#providers)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Documentation](#documentation)
- [Getting Help](#getting-help)
- [Community](#community)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

For `kubectl` to connect and interface properly with your [Amazon Elastic Kubernetes Service (EKS)](https://aws.amazon.com/eks) cluster, you have to install and configure the [AWS Command Line Interface (CLI)](https://aws.amazon.com/cli/) with the `aws-iam-authenticator` component. Instructions on how to install the following components can be found below:

- [aws-cli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [aws-iam-authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)
- [kubectl](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)

## Usage

```hcl
module "ocean-eks" {
  source = "spotinst/ocean-eks/spotinst"

  # Credentials.
  spotinst_token   = var.spotinst_token
  spotinst_account = var.spotinst_account
}
```

## Examples

- [Simple Cluster](https://github.com/spotinst/terraform-spotinst-ocean-eks/tree/master/examples/simple-cluster)

## Resources

This module creates and manages the following resources:

- aws_vpc (optional)
- aws_eks_cluster
- spotinst_ocean_aws

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >=0.12.15, <0.13 |
| aws | >= 3.3.0 |
| kubernetes | >= 1.13.0 |
| random | >= 3.0.0 |
| spotinst | >= 1.27.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.3.0 |
| random | >= 3.0.0 |
| spotinst | >= 1.27.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami\_id | The image ID for the EKS worker nodes. If none is provided, Terraform will search for the latest version of their EKS optimized worker AMI based on platform | `string` | `null` | no |
| associate\_public\_ip\_address | Associate a public IP address to worker nodes | `bool` | `false` | no |
| attach\_worker\_cni\_policy | Whether to attach the Amazon managed `AmazonEKS_CNI_Policy` IAM policy to the default worker IAM role. WARNING: If set `false` the permissions must be assigned to the `aws-node` DaemonSet pods via another method or nodes will not be able to join the cluster | `bool` | `true` | no |
| aws\_auth\_additional\_labels | Additional kubernetes labels applied on aws-auth ConfigMap | `map(string)` | `{}` | no |
| cluster\_create\_endpoint\_private\_access\_sg\_rule | Whether to create security group rules for the access to the Amazon EKS private API server endpoint | `bool` | `false` | no |
| cluster\_create\_security\_group | Whether to create a security group for the cluster or attach the cluster to `cluster_security_group_id` | `bool` | `true` | no |
| cluster\_create\_timeout | Timeout value when creating the EKS cluster | `string` | `"30m"` | no |
| cluster\_delete\_timeout | Timeout value when deleting the EKS cluster | `string` | `"15m"` | no |
| cluster\_enabled\_log\_types | A list of the desired control plane logging to enable. For more information, see Amazon EKS Control Plane Logging documentation (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html) | `list(string)` | `[]` | no |
| cluster\_encryption\_config | Configuration block with encryption configuration for the cluster. See examples/secrets\_encryption/main.tf for example format | <pre>list(object({<br>    provider_key_arn = string<br>    resources        = list(string)<br>  }))</pre> | `[]` | no |
| cluster\_endpoint\_private\_access | Indicates whether or not the Amazon EKS private API server endpoint is enabled | `bool` | `false` | no |
| cluster\_endpoint\_private\_access\_cidrs | List of CIDR blocks which can access the Amazon EKS private API server endpoint | `list(string)` | `null` | no |
| cluster\_endpoint\_public\_access | Indicates whether or not the Amazon EKS public API server endpoint is enabled | `bool` | `true` | no |
| cluster\_endpoint\_public\_access\_cidrs | List of CIDR blocks which can access the Amazon EKS public API server endpoint | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| cluster\_iam\_role\_name | IAM role name for the cluster. Only applicable if manage\_cluster\_iam\_resources is set to false | `string` | `""` | no |
| cluster\_identifier | Cluster identifier | `string` | `null` | no |
| cluster\_log\_kms\_key\_id | If a KMS Key ARN is set, this key will be used to encrypt the corresponding log group. Please be sure that the KMS Key has an appropriate key policy (https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/encrypt-log-data-kms.html) | `string` | `""` | no |
| cluster\_log\_retention\_in\_days | Number of days to retain log events. Default retention - 90 days | `number` | `90` | no |
| cluster\_name | Name of the EKS cluster. Also used as a prefix in names of related resources | `string` | `null` | no |
| cluster\_security\_group\_id | If provided, the EKS cluster will be attached to this security group. If not given, a security group will be created with necessary ingress/egress to work with the workers | `string` | `""` | no |
| cluster\_version | Kubernetes version to use for the EKS cluster | `string` | `"1.18"` | no |
| config\_output\_path | Where to save the Kubectl config file (if `write_kubeconfig = true`). Assumed to be a directory if the value ends with a forward slash `/` | `string` | `"./"` | no |
| create\_eks | Controls if EKS resources should be created (it affects almost all resources) | `bool` | `true` | no |
| create\_fargate\_pod\_execution\_role | Controls if the EKS Fargate pod execution IAM role should be created | `bool` | `true` | no |
| create\_ocean | Controls whether Ocean should be created (it affects all Ocean resources) | `bool` | `true` | no |
| desired\_capacity | The number of worker nodes to launch and maintain in the Ocean cluster | `number` | `1` | no |
| eks\_oidc\_root\_ca\_thumbprint | Thumbprint of Root CA for EKS OIDC, Valid until 2037 | `string` | `"9e99a48a9960b14926bb7f3b02e22da2b0ab7280"` | no |
| enable\_irsa | Whether to create OpenID Connect Provider for EKS to enable IRSA | `bool` | `false` | no |
| fargate\_pod\_execution\_role\_name | The IAM Role that provides permissions for the EKS Fargate Profile | `string` | `null` | no |
| fargate\_profiles | Fargate profiles to create. See `fargate_profile` keys section in fargate submodule's README.md for more details | `any` | `{}` | no |
| iam\_path | If provided, all IAM roles will be created on this path | `string` | `"/"` | no |
| key\_name | The key pair to attach to the worker nodes launched by Ocean | `string` | `null` | no |
| kubeconfig\_aws\_authenticator\_additional\_args | Any additional arguments to pass to the authenticator such as the role to assume. e.g. ["-r", "MyEksRole"] | `list(string)` | `[]` | no |
| kubeconfig\_aws\_authenticator\_command | Command to use to fetch AWS EKS credentials | `string` | `"aws-iam-authenticator"` | no |
| kubeconfig\_aws\_authenticator\_command\_args | Default arguments passed to the authenticator command. Defaults to [token -i $cluster\_name] | `list(string)` | `[]` | no |
| kubeconfig\_aws\_authenticator\_env\_variables | Environment variables that should be used when executing the authenticator. e.g. { AWS\_PROFILE = "eks"} | `map(string)` | `{}` | no |
| kubeconfig\_name | Override the default name used for items kubeconfig | `string` | `""` | no |
| manage\_aws\_auth | Whether to apply the aws-auth configmap file | `bool` | `true` | no |
| manage\_cluster\_iam\_resources | Whether to let the module manage cluster IAM resources. If set to false, cluster\_iam\_role\_name must be specified | `bool` | `true` | no |
| manage\_worker\_iam\_resources | Whether to let the module manage worker IAM resources. If set to false, iam\_instance\_profile\_name must be specified for workers | `bool` | `true` | no |
| map\_accounts | Additional AWS account numbers to add to the aws-auth configmap. See examples/basic/variables.tf for example format | `list(string)` | `[]` | no |
| map\_roles | Additional IAM roles to add to the aws-auth configmap. See examples/basic/variables.tf for example format | <pre>list(object({<br>    rolearn  = string<br>    username = string<br>    groups   = list(string)<br>  }))</pre> | `[]` | no |
| map\_users | Additional IAM users to add to the aws-auth configmap. See examples/basic/variables.tf for example format | <pre>list(object({<br>    userarn  = string<br>    username = string<br>    groups   = list(string)<br>  }))</pre> | `[]` | no |
| max\_size | The upper limit of worker nodes the Ocean cluster can scale up to | `number` | `null` | no |
| min\_size | The lower limit of worker nodes the Ocean cluster can scale down to | `number` | `null` | no |
| node\_groups | Map of map of node groups to create. See `node_groups` module's documentation for more details | `any` | `{}` | no |
| node\_groups\_defaults | Map of values to be applied to all node groups. See `node_groups` module's documentation for more details | `any` | `{}` | no |
| permissions\_boundary | If provided, all IAM roles will be created with this permissions boundary attached | `string` | `null` | no |
| region | The region the EKS cluster will be located | `string` | `null` | no |
| spotinst\_account | Spot account ID | `string` | n/a | yes |
| spotinst\_token | Spot Personal Access token | `string` | n/a | yes |
| subnets | A list of subnets to place the EKS cluster and workers within | `list(string)` | `null` | no |
| tags | A map of tags to add to all resources. Tags added to launch coniguration or templates override these values for ASG Tags only | `map(string)` | `{}` | no |
| vpc\_id | VPC where the cluster and workers will be deployed | `string` | `null` | no |
| wait\_for\_cluster\_cmd | Custom local-exec command to execute for determining if the eks cluster is healthy. Cluster endpoint will be available as an environment variable called ENDPOINT | `string` | `"for i in `seq 1 60`; do if `command -v wget > /dev/null`; then wget --no-check-certificate -O - -q $ENDPOINT/healthz >/dev/null && exit 0 || true; else curl -k -s $ENDPOINT/healthz >/dev/null && exit 0 || true;fi; sleep 5; done; echo TIMEOUT && exit 1"` | no |
| wait\_for\_cluster\_interpreter | Custom local-exec command line interpreter for the command to determining if the eks cluster is healthy | `list(string)` | <pre>[<br>  "/bin/sh",<br>  "-c"<br>]</pre> | no |
| worker\_additional\_security\_group\_ids | A list of additional security group ids to attach to worker instances | `list(string)` | `[]` | no |
| worker\_ami\_name\_filter | Name filter for AWS EKS worker AMI. If not provided, the latest official AMI for the specified 'cluster\_version' is used | `string` | `""` | no |
| worker\_ami\_name\_filter\_windows | Name filter for AWS EKS Windows worker AMI. If not provided, the latest official AMI for the specified 'cluster\_version' is used | `string` | `""` | no |
| worker\_ami\_owner\_id | The ID of the owner for the AMI to use for the AWS EKS workers. Valid values are an AWS account ID, 'self' (the current account), or an AWS owner alias (e.g. 'amazon', 'aws-marketplace', 'microsoft') | `string` | `"amazon"` | no |
| worker\_ami\_owner\_id\_windows | The ID of the owner for the AMI to use for the AWS EKS Windows workers. Valid values are an AWS account ID, 'self' (the current account), or an AWS owner alias (e.g. 'amazon', 'aws-marketplace', 'microsoft') | `string` | `"amazon"` | no |
| worker\_create\_cluster\_primary\_security\_group\_rules | Whether to create security group rules to allow communication between pods on workers and pods using the primary cluster security group | `bool` | `false` | no |
| worker\_create\_initial\_lifecycle\_hooks | Whether to create initial lifecycle hooks provided in worker groups | `bool` | `false` | no |
| worker\_create\_security\_group | Whether to create a security group for the workers or attach the workers to `worker_security_group_id` | `bool` | `true` | no |
| worker\_groups | A list of maps defining worker group configurations to be defined using AWS Launch Configurations. See workers\_group\_defaults for valid keys | `any` | <pre>[<br>  {<br>    "asg_desired_capacity": 0,<br>    "asg_max_size": 0,<br>    "asg_min_size": 0<br>  }<br>]</pre> | no |
| worker\_groups\_launch\_template | A list of maps defining worker group configurations to be defined using AWS Launch Templates. See workers\_group\_defaults for valid keys | `any` | `[]` | no |
| worker\_security\_group\_id | If provided, all workers will be attached to this security group. If not given, a security group will be created with necessary ingress/egress to work with the EKS cluster | `string` | `""` | no |
| worker\_sg\_ingress\_from\_port | Minimum port number from which pods will accept communication. Must be changed to a lower value if some pods in your cluster will expose a port lower than 1025 (e.g. 22, 80, or 443) | `number` | `1025` | no |
| workers\_additional\_policies | Additional policies to be added to workers | `list(string)` | `[]` | no |
| workers\_group\_defaults | Override default values for target groups. See workers\_group\_defaults\_defaults in local.tf for valid keys | `any` | `{}` | no |
| workers\_role\_name | User defined workers role name | `string` | `""` | no |
| write\_kubeconfig | Whether to write a Kubectl config file containing the cluster configuration. Saved to `config_output_path` | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| cloudwatch\_log\_group\_arn | Arn of cloudwatch log group created |
| cloudwatch\_log\_group\_name | Name of cloudwatch log group created |
| cluster\_arn | The Amazon Resource Name (ARN) of the cluster |
| cluster\_certificate\_authority\_data | Nested attribute containing certificate-authority-data for your cluster. This is the base64 encoded certificate data required to communicate with your cluster |
| cluster\_endpoint | The endpoint for your EKS Kubernetes API |
| cluster\_iam\_role\_arn | IAM role ARN of the EKS cluster |
| cluster\_iam\_role\_name | IAM role name of the EKS cluster |
| cluster\_id | The name/id of the EKS cluster. Will block on cluster creation until the cluster is really ready |
| cluster\_oidc\_issuer\_url | The URL on the EKS cluster OIDC Issuer |
| cluster\_primary\_security\_group\_id | The cluster primary security group ID created by the EKS cluster on 1.14 or later. Referred to as 'Cluster security group' in the EKS console |
| cluster\_security\_group\_id | Security group ID attached to the EKS cluster. On 1.14 or later, this is the 'Additional security groups' in the EKS console |
| cluster\_version | The Kubernetes server version for the EKS cluster |
| config\_map\_aws\_auth | A kubernetes configuration to authenticate to this EKS cluster |
| kubeconfig | kubectl config file contents for this EKS cluster |
| kubeconfig\_filename | The filename of the generated kubectl config |
| ocean\_cluster\_id | The ID of the Ocean cluster |
| ocean\_controller\_id | The ID of the Ocean controller |
| oidc\_provider\_arn | The ARN of the OIDC Provider if `enable_irsa = true` |
| security\_group\_rule\_cluster\_https\_worker\_ingress | Security group rule responsible for allowing pods to communicate with the EKS cluster API |
| worker\_iam\_instance\_profile\_arns | Default IAM instance profile ARN for EKS worker groups |
| worker\_iam\_instance\_profile\_names | Default IAM instance profile name for EKS worker groups |
| worker\_iam\_role\_arn | Default IAM role ARN for EKS worker groups |
| worker\_iam\_role\_name | Default IAM role name for EKS worker groups |
| worker\_security\_group\_id | Security group ID attached to the EKS workers |
| workers\_default\_ami\_id | ID of the default worker group AMI |
| workers\_user\_data | User data of worker groups |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Documentation

If you're new to [Spot](https://spot.io/) and want to get started, please checkout our [Getting Started](https://docs.spot.io/connect-your-cloud-provider/) guide, available on the [Spot Documentation](https://docs.spot.io/) website.

## Getting Help

We use GitHub issues for tracking bugs and feature requests. Please use these community resources for getting help:

- Ask a question on [Stack Overflow](https://stackoverflow.com/) and tag it with [terraform-spotinst](https://stackoverflow.com/questions/tagged/terraform-spotinst/).
- Join our [Spot](https://spot.io/) community on [Slack](http://slack.spot.io/).
- Open an issue.

## Community

- [Slack](http://slack.spot.io/)
- [Twitter](https://twitter.com/spot_hq/)

## Contributing

Please see the [contribution guidelines](CONTRIBUTING.md).

## License

Code is licensed under the [Apache License 2.0](LICENSE).
