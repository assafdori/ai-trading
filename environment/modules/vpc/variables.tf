variable "vpc_name" {
	type = string
	default = "main-vpc"
}

variable "cidr" {
	type = string
	default = "10.0.0.0/16"
}

variable "azs" {
	type = list
	default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnets" {
	type = list
	default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
	type = list
	default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}
