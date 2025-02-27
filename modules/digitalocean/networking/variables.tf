variable "do_region" {
  type        = string
  description = "DigitalOcean region"
}

variable "ssh_port" {
  type        = number
  description = "SSH port for the server"
  validation {
    condition     = var.ssh_port >= var.ssh_port_range.min && var.ssh_port <= var.ssh_port_range.max
    error_message = "SSH port must be between ${var.ssh_port_range.min} and ${var.ssh_port_range.max}."
  }
}

variable "environment" {
  type        = string
  description = "Environment name (e.g., prod, staging, dev)"
}

variable "ssh_port_range" {
  type = object({
    min = number
    max = number
  })
  description = "Valid range for SSH ports"
}

variable "server_id" {
  type        = string
  description = "ID of the server droplet"
}
