module "ec2_instance" {
  source = "../modules/ec2"

  name = var.name

  instance_type          = var.instance_type
  key_name               = var.ec2_key_name
  monitoring             = var.monitoring
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = module.vpc.public_subnets[0]
}

module "sg" {
  source = "../modules/securitygroups"
  
  sg_name = var.sg_name
  description = var.description
  vpc_id = module.vpc.vpc_id
  ingress_cidr_blocks = var.ingress_cidr_blocks
  ingress_rules = var.ingress_rules
  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
}

module "key_pair" {
  source = "../modules/keypairs"
  
  key_name = var.key_name
  create_private_key = var.create_private_key
}
