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
| spotinst | >= 1.27.0 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | n/a |
| spotinst | >= 1.27.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami\_id | The image ID for the EKS worker nodes. If none is provided, Terraform will search for the latest version of their EKS optimized worker AMI based on platform | `string` | `null` | no |
| associate\_public\_ip\_address | Associate a public IP address to worker nodes | `bool` | `false` | no |
| cluster\_identifier | Cluster identifier | `string` | `null` | no |
| cluster\_name | Cluster name | `string` | `null` | no |
| cluster\_version | Kubernetes supported version | `string` | `"1.18"` | no |
| desired\_capacity | The number of worker nodes to launch and maintain in the Ocean cluster | `number` | `1` | no |
| key\_name | The key pair to attach to the worker nodes launched by Ocean | `string` | `null` | no |
| max\_size | The upper limit of worker nodes the Ocean cluster can scale up to | `number` | `null` | no |
| min\_size | The lower limit of worker nodes the Ocean cluster can scale down to | `number` | `null` | no |
| region | The region the EKS cluster will be located | `string` | `null` | no |
| spotinst\_account | Spot account ID | `string` | n/a | yes |
| spotinst\_token | Spot Personal Access token | `string` | n/a | yes |
| subnets | A list of subnets to place the EKS cluster and workers within | `list(string)` | `null` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpc\_id | VPC where the cluster and workers will be deployed | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| cloudwatch\_log\_group\_name | Name of cloudwatch log group created |
| cluster\_arn | The Amazon Resource Name (ARN) of the cluster |
| cluster\_certificate\_authority\_data | Nested attribute containing certificate-authority-data for your cluster. This is the base64 encoded certificate data required to communicate with your cluster |
| cluster\_endpoint | The endpoint for your EKS Kubernetes API |
| cluster\_iam\_role\_arn | IAM role ARN of the EKS cluster |
| cluster\_iam\_role\_name | IAM role name of the EKS cluster |
| cluster\_id | The name/id of the EKS cluster |
| cluster\_oidc\_issuer\_url | The URL on the EKS cluster OIDC Issuer |
| cluster\_security\_group\_id | Security group ID attached to the EKS cluster |
| cluster\_version | The Kubernetes server version for the EKS cluster |
| config\_map\_aws\_auth | A kubernetes configuration to authenticate to this EKS cluster |
| kubeconfig | kubectl config file contents for this EKS cluster |
| kubeconfig\_filename | The filename of the generated kubectl config |
| ocean\_cluster\_id | The ID of the Ocean cluster |
| ocean\_controller\_id | The ID of the Ocean controller |
| oidc\_provider\_arn | The ARN of the OIDC Provider if `enable_irsa = true` |
| worker\_iam\_role\_arn | Default IAM role ARN for EKS worker groups |
| worker\_iam\_role\_name | Default IAM role name for EKS worker groups |
| worker\_node\_security\_group\_id | The Security Group ID for the EKS workers |

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
