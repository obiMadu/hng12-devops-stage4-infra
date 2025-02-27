output "server_firewall_id" {
  value       = digitalocean_firewall.server-firewall.id
  description = "ID of the server firewall"
}
