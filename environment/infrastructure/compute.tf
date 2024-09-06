module "ec2_instance" {
  source = "../modules/ec2"
}

module "key_pair" {
  source = "../modules/keypairs"
}
