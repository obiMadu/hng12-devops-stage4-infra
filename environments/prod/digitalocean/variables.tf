# Project variables
variable "project_name" {
  type        = string
  description = "Name of the infrastructure project"
  default     = "infrastructure"
}

variable "project_description" {
  type        = string
  description = "Description of the infrastructure project"
  default     = "Infrastructure for hosting services"
}

variable "project_purpose" {
  type        = string
  description = "Purpose of the infrastructure project"
  default     = "Infrastructure Management"
}

variable "environment" {
  type        = string
  description = "Environment name (e.g., prod, staging, dev)"
  default     = "production"
}

variable "subdomains" {
  type        = set(string)
  description = "List of subdomains to create"
  default     = []
}

## Digital Ocean Variables
variable "do_token" {
  type        = string
  sensitive   = true
  description = "DigitalOcean API token"
}

variable "do_server_size" {
  type    = string
  default = "s-2vcpu-4gb"
}

variable "do_server_image" {
  type    = string
  default = "ubuntu-24-04-x64"
}

variable "do_region" {
  type    = string
  default = "fra1"
}

variable "domain" {
  type    = string
  default = "obi.ninja"
}

## Cloudflare Variables
variable "cloudflare_api_token" {
  type = string
}

variable "cloudflare_zone_id" {
  type = string
}

## SSH Variables
variable "ssh_port" {
  type    = number
  default = 23232

  validation {
    condition     = var.ssh_port >= var.ssh_port_range.min && var.ssh_port <= var.ssh_port_range.max
    error_message = "SSH port must be between ${var.ssh_port_range.min} and ${var.ssh_port_range.max}."
  }
}

variable "ssh_port_range" {
  type = object({
    min = number
    max = number
  })
  description = "Valid range for SSH ports"
  default = {
    min = 1024
    max = 49151
  }
}
