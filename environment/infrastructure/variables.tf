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

variable "zones" {
  description = "Map of hosted zones"
  type = map(object({
    comment = string
    tags    = optional(map(string))
  }))

  default = {
    "assaf-trading.com" = {
      comment = "assaf-trading.com (production zone)"
      tags = {
        env = "production"
      }
    }
  }
}


variable "tags" {
  description = "Tags to associate with resources"
  type        = map(string)
  default     = {}
}

variable "zone_name" {
  description = "Name of the Route 53 zone"
  type        = string
  default = "assaf-trading.com"
}

variable "records" {
  description = "List of DNS records for the zone"
  type = list(object({
    name = string
    type = string
    ttl  = optional(number)
    alias = optional(object({
      name    = string
      zone_id = string
    }))
    records = optional(list(string))
  }))
  default = [ {
    name = "www"
    type = "A"
    alias = {
      name    = "d1234567890.cloudfront.net"
      zone_id = "Z12ABCDEFGHIJKL"
    }
  } ]
}
########### VARIABLE RECORDS ARE PLACEHOLDER, NEEDS TO REPLACE, I THINK I WILL NEED BOTH CNAME AND A RECORDS ###########

##################
######## ALB #####
##################

variable "alb_name" {
  description = "Name of the ALB"
  type        = string
  default     = "ai-trading-alb"
}

variable "alb_vpc_id" {
  description = "Which VPC to deploy the ALB to"
  type        = string
  default     = ""
}

variable "alb_subnets" {
  description = "Which subnets to deploy the ALB to"
  type        = list
  default     = []
}

variable "alb_security_group_ingress_rules" {
  description = "Ingress rules for the ALB security group"
  type        = map(object({
    from_port   = number
    to_port     = number
    ip_protocol = string
    description = string
    cidr_ipv4   = string
  }))
  default     = {
    all_http = {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      description = "HTTP web traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
    all_https = {
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      description = "HTTPS web traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
    }
}

variable "alb_security_group_egress_rules" {
    description = "Egress rules for the ALB security group"
    type        = map(object({
        from_port   = number
        to_port     = number
        ip_protocol = string
        description = string
        cidr_ipv4   = string
    }))
    default     = {
        all_traffic = {
        from_port   = 0
        to_port     = 0
        ip_protocol = "-1"
        description = "All traffic"
        cidr_ipv4   = "10.0.0.0/16"
        }      
    }
}

variable "alb_access_logs_bucket" {
  description = "The S3 bucket to store the ALB access logs"
  type        = string
  default     = "default-alb-access-logs-bucket"
  
}

variable "alb_listener_http_port" {
  description = "Port for HTTP listener"
  type        = number
  default = 80
}

variable "alb_listener_http_protocol" {
  description = "Protocol for HTTP listener"
  type        = string
  default = "HTTP"
}

variable "alb_redirect_port" {
  description = "Port for HTTPS redirect"
  type        = string
  default = "443"
}

variable "alb_redirect_protocol" {
  description = "Protocol for HTTPS redirect"
  type        = string
  default = "HTTPS"
}

variable "alb_redirect_status_code" {
  description = "Status code for redirect"
  type        = string
  default = "HTTP_301"
}

variable "alb_listener_https_port" {
  description = "Port for HTTPS listener"
  type        = number
  default = 443
}

variable "alb_listener_https_protocol" {
  description = "Protocol for HTTPS listener"
  type        = string
  default = "HTTPS"
}

variable "alb_certificate_arn" {
  description = "ARN of the certificate for HTTPS listener"
  type        = string
  default = "?"
}

variable "alb_target_group_key" {
  description = "Key for forwarding traffic to the target group"
  type        = string
  
}

variable "alb_target_group_name_prefix" {
  description = "Prefix for the target group name"
  type        = string
}

variable "alb_target_group_protocol" {
  description = "Protocol for the target group"
  type        = string
}

variable "alb_target_group_port" {
  description = "Port for the target group"
  type        = number
}

variable "alb_target_group_type" {
  description = "Target type for the target group"
  type        = string
}

variable "alb_target_group_id" {
  description = "ID of the target (e.g., instance ID)"
  type        = string
}

variable "alb_tags" {
  description = "Tags for the ALB"
  type        = map(string)
}
