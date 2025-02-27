variable "environment" {
  type        = string
  description = "Environment (Production, Staging, etc.)"
}

variable "project_name" {
  type        = string
  description = "Name of the infrastructure project"
}

variable "project_description" {
  type        = string
  description = "Description of the infrastructure project"
}

variable "project_purpose" {
  type        = string
  description = "Purpose of the infrastructure project"
}


variable "resources" {
  type        = list(string)
  description = "List of resource URNs to add to the project"
}
