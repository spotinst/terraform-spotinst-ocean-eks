module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = ">= 2.78.0"

  create_vpc         = var.vpc_id == null
  name               = local.cluster_name
  azs                = data.aws_availability_zones.available.names
  cidr               = "10.0.0.0/16"
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  tags = merge(
    var.tags,
    {
      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    },
  )
}
