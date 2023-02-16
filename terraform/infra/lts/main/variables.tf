variable "project_id" {
  description = "The gcp project ID. Changing this forces a new project to be created."
  type        = string
}

variable "terraform_roles" {
  description = "IAM roles to assign to the terraform service account"
  type        = list(string)
}