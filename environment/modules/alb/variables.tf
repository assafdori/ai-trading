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

variable "alb_access_logs_bucket" {
  description = "S3 bucket for access logs"
  type        = string
}

variable "alb_listener_http_port" {
  description = "Port for HTTP listener"
  type        = number
}

variable "alb_listener_http_protocol" {
  description = "Protocol for HTTP listener"
  type        = string
}

variable "alb_redirect_port" {
  description = "Port for HTTPS redirect"
  type        = string
}

variable "alb_redirect_protocol" {
  description = "Protocol for HTTPS redirect"
  type        = string
}

variable "alb_redirect_status_code" {
  description = "Status code for redirect"
  type        = string
}

variable "alb_listener_https_port" {
  description = "Port for HTTPS listener"
  type        = number
}

variable "alb_listener_https_protocol" {
  description = "Protocol for HTTPS listener"
  type        = string
}

variable "alb_certificate_arn" {
  description = "ARN of the certificate for HTTPS listener"
  type        = string
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
