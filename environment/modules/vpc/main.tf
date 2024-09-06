module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway    = true
  enable_vpn_gateway    = true
  single_nat_gateway    = true
  enable_dns_hostnames  = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
