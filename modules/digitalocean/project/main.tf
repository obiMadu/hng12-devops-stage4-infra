terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_project" "project" {
  name        = var.project_name
  description = var.project_description
  purpose     = var.project_purpose
  environment = var.environment
}

resource "digitalocean_project_resources" "project_resources" {
  project = digitalocean_project.project.id
  resources = var.resources
}
