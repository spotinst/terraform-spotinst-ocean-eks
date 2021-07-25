module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = ">= 2.78.0"

  create_vpc             = var.vpc_id == null
  name                   = local.cluster_name
  azs                    = data.aws_availability_zones.available.names
  cidr                   = var.cidr
  private_subnets        = var.private_subnets
  public_subnets         = var.public_subnets
  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  reuse_nat_ips          = var.reuse_nat_ips
  external_nat_ip_ids    = var.external_nat_ip_ids

  tags = merge(
    var.tags,
    {
      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    },
  )
}
