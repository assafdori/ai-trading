module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name           = var.key_name
  create_private_key = true
}
