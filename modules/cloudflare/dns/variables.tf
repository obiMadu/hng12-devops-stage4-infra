variable "environment" {
  type        = string
  description = "Environment name (e.g., prod, staging, dev)"
}

variable "cloudflare_zone_id" {
  type        = string
  description = "Cloudflare Zone ID"
}

variable "domain" {
  type        = string
  description = "Main domain name"
}

variable "server_ipv4" {
  type        = string
  description = "Server IPv4 address"
}

variable "subdomains" {
  type        = set(string)
  description = "List of subdomains to create"
  default     = []
}
