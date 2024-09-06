module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway    = var.enable_nat_gateway
  enable_vpn_gateway    = var.enable_vpn_gateway
  single_nat_gateway    = var.single_nat_gateway
  enable_dns_hostnames  = var.enable_dns_hostnames

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
