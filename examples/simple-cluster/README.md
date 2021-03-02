# Simple Cluster

This example illustrates how to create a simple cluster.

## Usage

To provision this example, run the following from within this directory:
- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Modules

| Name | Source | Version |
|------|--------|---------|
| ocean-eks | ../.. |  |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| spotinst\_account | Spot account ID | `string` | n/a | yes |
| spotinst\_token | Spot Personal Access token | `string` | n/a | yes |

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
