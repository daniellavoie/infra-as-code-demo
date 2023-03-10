
variable "apis" {
  description = "The services to enable"
  type        = list(string)
}

variable "project_billing_account_id" {
  description = "The name of the billing account."
  type        = string
}

variable "project_folder_id" {
  description = "The numeric ID of the folder this project should be created under. Changing this forces the project to be migrated to the newly specified folder."
  type        = string
}

variable "project_id" {
  description = "The gcp project ID. Changing this forces a new project to be created."
  type        = string
}

variable "project_name" {
  description = "The display name of the gcp project"
  type        = string
}

variable "terraform_roles" {
  description = "IAM roles to assign to the terraform service account"
  type        = list(string)
}