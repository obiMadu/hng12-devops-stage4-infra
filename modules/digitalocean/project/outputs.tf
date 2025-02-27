output "project_id" {
  value       = digitalocean_project.project.id
  description = "ID of the created project"
}

output "project_name" {
  value       = digitalocean_project.project.name
  description = "Name of the created project"
}
