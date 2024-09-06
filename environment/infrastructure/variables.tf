#######################
######## GLOBAL #######
#######################

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

#######################
######## VPC ##########
#######################

variable "vpc_name" {
	type = string
	default = "main-vpc"
	description = "The name of the VPC"
}

variable "cidr" {
	type = string
	default = "10.0.0.0/16"
	description = "The CIDR block for the VPC"
}

variable "azs" {
	type = list
	default = ["us-east-1a", "us-east-1b", "us-east-1c"]
	description = "The availability zones to use for the VPC"
}

variable "private_subnets" {
	type = list
	default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
	description = "The private subnets to use for the VPC"
}

variable "public_subnets" {
	type = list
	default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
	description = "The public subnets to use for the VPC"
}

variable "enable_nat_gateway" {
	type = bool
	default = true
	description = "Enable NAT gateway"
}

variable "enable_vpn_gateway" {
	type = bool
	default = true
	description = "Enable VPN gateway"
}

variable "enable_dns_hostnames" {
	type = bool
	default = true
	description = "Enable DNS hostnames"
}

variable "single_nat_gateway" {
	type = bool
	default = true
	description = "Enable single NAT gateway"
}

#######################
######## EC2 ##########
#######################

variable "name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ai-trading-server"
}

variable "instance_type" {
  description = "The type of EC2 Instances"
  type        = string
  default     = "t2.micro"
}

variable "ec2_key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = "ai-trading-key"
}

variable "vpc_security_group_ids" {
  description = "The ID of the security group to associate with the instance"
  type        = list
  default     = []
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the instance"
  type        = string
  default     = ""
}

variable "monitoring" {
  description = "Enable or disable monitoring"
  type        = bool
  default     = true
}

#######################
######## KEYPAIR ######
#######################

variable "key_name" {
  description = "Value of the Name tag for the key pair"
  type        = string
  default     = "ai-trading-key"
}

variable "create_private_key" {
  description = "Create private key"
  type        = bool
  default     = true
}

#######################
######## SG ###########
#######################

variable "sg_name" {
  description = "Value of the Name tag for the SG"
  type        = string
  default     = "ai-trading-sg"
} 
variable "description" {
  description = "Value of the Name tag for the SG"
  type        = string
  default     = "SG for ai-trading"
}
variable "vpc_id" {
  description = "Value of the Name tag for the SG"
  type        = string
  default     = ""
}
variable "ingress_cidr_blocks" {
  description = "Value of the Name tag for the SG"
  type        = list
  default     = ["0.0.0.0/0"]
}
variable "ingress_rules" {
  description = "Value of the Name tag for the SG"
  type        = list
  default     = ["all-all"]
}
variable "ingress_with_cidr_blocks" {
  description = "Value of the Name tag for the SG"
  type        = list
  default     = []
}

#######################
######## ROUTE53 ######
#######################

