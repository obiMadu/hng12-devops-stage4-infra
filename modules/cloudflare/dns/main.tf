terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

resource "cloudflare_record" "server" {
  zone_id = var.cloudflare_zone_id
  name    = var.domain
  value   = var.server_ipv4
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "subdomains" {
  for_each = var.subdomains

  zone_id = var.cloudflare_zone_id
  name    = each.key
  value   = var.server_ipv4
  type    = "A"
  ttl     = 1
}
