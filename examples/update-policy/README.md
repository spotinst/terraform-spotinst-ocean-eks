# Update Policy

This example illustrates how a cluster can be configured to roll in 25% batches.

## Usage

To provision this example, run the following from within this directory:
- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.37 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |
| <a name="requirement_spotinst"></a> [spotinst](#requirement\_spotinst) | ~> 1.60 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ocean-eks"></a> [ocean-eks](#module\_ocean-eks) | ../.. | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_spotinst_account"></a> [spotinst\_account](#input\_spotinst\_account) | Spot account ID | `string` | n/a | yes |
| <a name="input_spotinst_token"></a> [spotinst\_token](#input\_spotinst\_token) | Spot Personal Access token | `string` | n/a | yes |
| <a name="input_update_policy"></a> [update\_policy](#input\_update\_policy) | Configures the cluster update policy | <pre>object({<br>    should_roll           = bool<br>    batch_size_percentage = number<br>    launch_spec_ids       = list(string)<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_log_group_arn"></a> [cloudwatch\_log\_group\_arn](#output\_cloudwatch\_log\_group\_arn) | Arn of cloudwatch log group created |
| <a name="output_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#output\_cloudwatch\_log\_group\_name) | Name of cloudwatch log group created |
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | The Amazon Resource Name (ARN) of the cluster |
| <a name="output_cluster_certificate_authority_data"></a> [cluster\_certificate\_authority\_data](#output\_cluster\_certificate\_authority\_data) | Nested attribute containing certificate-authority-data for your cluster. This is the base64 encoded certificate data required to communicate with your cluster |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | The endpoint for your EKS Kubernetes API |
| <a name="output_cluster_iam_role_arn"></a> [cluster\_iam\_role\_arn](#output\_cluster\_iam\_role\_arn) | IAM role ARN of the EKS cluster |
| <a name="output_cluster_iam_role_name"></a> [cluster\_iam\_role\_name](#output\_cluster\_iam\_role\_name) | IAM role name of the EKS cluster |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The name/id of the EKS cluster. Will block on cluster creation until the cluster is really ready |
| <a name="output_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#output\_cluster\_oidc\_issuer\_url) | The URL on the EKS cluster OIDC Issuer |
| <a name="output_cluster_primary_security_group_id"></a> [cluster\_primary\_security\_group\_id](#output\_cluster\_primary\_security\_group\_id) | The cluster primary security group ID created by the EKS cluster on 1.14 or later. Referred to as 'Cluster security group' in the EKS console |
| <a name="output_cluster_security_group_id"></a> [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | Security group ID attached to the EKS cluster. On 1.14 or later, this is the 'Additional security groups' in the EKS console |
| <a name="output_cluster_version"></a> [cluster\_version](#output\_cluster\_version) | The Kubernetes server version for the EKS cluster |
| <a name="output_config_map_aws_auth"></a> [config\_map\_aws\_auth](#output\_config\_map\_aws\_auth) | A kubernetes configuration to authenticate to this EKS cluster |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | kubectl config file contents for this EKS cluster |
| <a name="output_kubeconfig_filename"></a> [kubeconfig\_filename](#output\_kubeconfig\_filename) | The filename of the generated kubectl config |
| <a name="output_ocean_cluster_id"></a> [ocean\_cluster\_id](#output\_ocean\_cluster\_id) | The ID of the Ocean cluster |
| <a name="output_ocean_controller_id"></a> [ocean\_controller\_id](#output\_ocean\_controller\_id) | The ID of the Ocean controller |
| <a name="output_oidc_provider_arn"></a> [oidc\_provider\_arn](#output\_oidc\_provider\_arn) | The ARN of the OIDC Provider if `enable_irsa = true` |
| <a name="output_security_group_rule_cluster_https_worker_ingress"></a> [security\_group\_rule\_cluster\_https\_worker\_ingress](#output\_security\_group\_rule\_cluster\_https\_worker\_ingress) | Security group rule responsible for allowing pods to communicate with the EKS cluster API |
| <a name="output_worker_iam_instance_profile_arns"></a> [worker\_iam\_instance\_profile\_arns](#output\_worker\_iam\_instance\_profile\_arns) | Default IAM instance profile ARN for EKS worker groups |
| <a name="output_worker_iam_instance_profile_names"></a> [worker\_iam\_instance\_profile\_names](#output\_worker\_iam\_instance\_profile\_names) | Default IAM instance profile name for EKS worker groups |
| <a name="output_worker_iam_role_arn"></a> [worker\_iam\_role\_arn](#output\_worker\_iam\_role\_arn) | Default IAM role ARN for EKS worker groups |
| <a name="output_worker_iam_role_name"></a> [worker\_iam\_role\_name](#output\_worker\_iam\_role\_name) | Default IAM role name for EKS worker groups |
| <a name="output_worker_security_group_id"></a> [worker\_security\_group\_id](#output\_worker\_security\_group\_id) | Security group ID attached to the EKS workers |
| <a name="output_workers_default_ami_id"></a> [workers\_default\_ami\_id](#output\_workers\_default\_ami\_id) | ID of the default worker group AMI |
| <a name="output_workers_user_data"></a> [workers\_user\_data](#output\_workers\_user\_data) | User data of worker groups |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
