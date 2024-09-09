output "zone_ids" {
  description = "Route 53 zone IDs"
  value       = module.zones.route53_zone_zone_id
}

output "record_fqdns" {
  description = "Fully Qualified Domain Names (FQDNs) for the records"
  value       = module.records.route53_record_fqdn
}
