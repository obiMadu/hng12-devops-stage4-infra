output "main_record_id" {
  value       = cloudflare_record.server.id
  description = "ID of the main domain DNS record"
}

output "subdomain_record_ids" {
  value       = { for k, v in cloudflare_record.subdomains : k => v.id }
  description = "Map of subdomain names to their DNS record IDs"
}
