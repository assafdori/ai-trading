module "alb" {
  source = "terraform-aws-modules/alb/aws"

  name    = var.alb_name
  vpc_id  = var.alb_vpc_id
  subnets = var.alb_subnets

  # Security Group
  security_group_ingress_rules = var.alb_security_group_ingress_rules
  security_group_egress_rules  = var.alb_security_group_egress_rules

  access_logs = {
    bucket = var.alb_access_logs_bucket
  }

  listeners = {
    http-https-redirect = {
      port     = var.alb_listener_http_port
      protocol = var.alb_listener_http_protocol
      redirect = {
        port        = var.alb_redirect_port
        protocol    = var.alb_redirect_protocol
        status_code = var.alb_redirect_status_code
      }
    }
    https = {
      port            = var.alb_listener_https_port
      protocol        = var.alb_listener_https_protocol
      certificate_arn = var.alb_certificate_arn

      forward = {
        target_group_key = var.alb_target_group_key
      }
    }
  }

  target_groups = {
    ex-instance = {
      name_prefix      = var.alb_target_group_name_prefix
      protocol         = var.alb_target_group_protocol
      port             = var.alb_target_group_port
      target_type      = var.alb_target_group_type
      target_id        = var.alb_target_group_id
    }
  }

  tags = var.alb_tags
}
