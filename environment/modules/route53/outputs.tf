output "zone_ids" {
  description = "Route 53 zone IDs"
  value       = module.zones.route53_zone_zone_id
}

output "zone_name_servers" {
  description = "Names of the records"
  value       = module.zones.route53_zone_name_servers
}

output "zone_arns" {
  description = "Names of the records"
  value       = module.zones.route53_zone_zone_arn
}

output "static_zone_name" {
  description = "Names of the records"
  value       = module.zones.route53_static_zone_name
}

output "zone_name" {
  description = "Names of the records"
  value       = module.zones.route53_zone_name
}

output "route53_record_name" {
  description = "Route 53 record IDs"
  value       = module.records.route53_record_name
}

output "record_fqdns" {
  description = "Fully Qualified Domain Names (FQDNs) for the records"
  value       = module.records.route53_record_fqdn
}