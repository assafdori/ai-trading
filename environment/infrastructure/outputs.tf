output "zone_ids" {
  description = "Route 53 zone IDs"
  value       = module.records.zone_ids
}

output "record_fqdns" {
  description = "Fully Qualified Domain Names (FQDNs) for the records"
  value       = module.records.record_fqdns
}