# Output the DNS name of the ALB
output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.alb.dns_name
}

# Output the ARN of the ALB
output "alb_arn" {
  description = "The ARN of the ALB"
  value       = module.alb.arn
}

# Output the Security Group ID for the ALB
output "alb_security_group_id" {
  description = "The Security Group ID of the ALB"
  value       = module.alb.security_group_id
}

