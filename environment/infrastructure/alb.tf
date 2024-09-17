module "alb" {
  source = "../modules/alb"

    alb_name = var.alb_name
    alb_vpc_id = var.alb_vpc_id
    alb_subnets = var.alb_subnets

    alb_security_group_ingress_rules = var.alb_security_group_ingress_rules
    alb_security_group_egress_rules = var.alb_security_group_egress_rules

    alb_access_logs_bucket = var.alb_access_logs_bucket

    alb_listener_http_port = var.alb_listener_http_port
    alb_listener_http_protocol = var.alb_listener_http_protocol
    alb_redirect_port = var.alb_redirect_port
    alb_redirect_protocol = var.alb_redirect_protocol
    alb_redirect_status_code = var.alb_redirect_status_code

    alb_listener_https_port = var.alb_listener_https_port
    alb_listener_https_protocol = var.alb_listener_https_protocol
    alb_certificate_arn = var.alb_certificate_arn
    
    alb_target_group_key = var.alb_target_group_key
    alb_target_group_name_prefix = var.alb_target_group_name_prefix
    alb_target_group_protocol = var.alb_target_group_protocol
    alb_target_group_id = var.alb_target_group_id
    alb_target_group_port = var.alb_target_group_port
    alb_target_group_type = var.alb_target_group_type
    alb_tags = var.alb_tags

}
