variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ai-trading-server"
}

variable "instance_type" {
  description = "The type of EC2 Instances"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = "ai-trading"
}

variable "vpc_security_group_ids" {
  description = "The ID of the security group to associate with the instance"
  type        = list
  default     = ["sg-12345678"]
}

