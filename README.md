# Spotinst Ocean Amazon EKS Terraform module

A Terraform module to Amazon EKS cluster with Ocean. The module will install the Ocean Controller into the cluster.

## Contents

  - [Usage](#usage)
  - [Prerequisites](#prerequisites)
  - [Examples](#examples)
  - [Resources](#resources)
  - [Variables](#variables)
  - [Documentation](#documentation)
  - [Getting Help](#getting-help)
  - [Community](#community)
  - [License](#license)

## Prerequisites

For `kubectl` to connect and interface properly with your AWS EKS cluster, you have to install and configure the AWS CLI with the `aws-iam-authenticator` component. Instructions on how to install the following components can be found below:
- [aws-cli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [aws-iam-authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)
- [kubectl](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)

## Usage

```hcl
module "ocean-eks" {
  source = "spotinst/ocean-eks/spotinst"

  # Credentials.
  spotinst_token   = "<spotinst_token>"
  spotinst_account = "<spotinst_account>"

  # Configuration.
  cluster_name     = "prod"
  region           = "us-west-2"
  min_size         = 1
  max_size         = 1
  desired_capacity = 1
  ...
}
```

## Examples

  - [Basic](examples/basic)

## Resources

This module creates and manages the following resources:
- aws_eks_cluster
- spotinst_ocean_aws

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| spotinst_token | Spotinst Personal Access token. | `string` | none | yes |
| spotinst_account | Spotinst account ID. | `string` | none | yes |
| region | Region the EKS cluster will be located in. | `string` | none | yes |
| cluster_name | Cluster name. | `string` | none | yes |
| cluster_identifier | Cluster identifier. | `string` | eks.cluster_id | no |
| cluster_version | Cluster Kubernetes version. | `string` | 1.15 | no |
| min_size | Lower limit of worker nodes the Ocean cluster can scale down to. | `number` | none | yes |
| max_size | Upper limit of worker nodes the Ocean cluster can scale up to. | `number` | none | yes |
| desired_capacity | Number of worker nodes to launch. | `number` | none | yes |
| key_name | Key pair to attach to the worker nodes. | `string` | none | no |
| ami_id | Image ID for the EKS worker nodes. | `string` | latest | no |
| associate_public_ip_address | Associate a public IP address to worker nodes. | `bool` | false | no |

## Documentation

If you're new to [Spot](https://spot.io/) and want to get started, please checkout our [Getting Started](https://api.spotinst.com/getting-started-with-spotinst/) guide, available on the [Spot Documentation](https://api.spotinst.com/) website.

## Getting Help

We use GitHub issues for tracking bugs and feature requests. Please use these community resources for getting help:

* Ask a question on [Stack Overflow](https://stackoverflow.com/) and tag it with [terraform-spotinst](https://stackoverflow.com/questions/tagged/terraform-spotinst/).
* Join our [Spot](https://spot.io/) community on [Slack](http://slack.spotinst.com/).
* Open an issue.

## Community

* [Slack](http://slack.spotinst.com/)
* [Twitter](https://twitter.com/spotinst/)

## License
Code is licensed under the [Apache License 2.0](LICENSE).
