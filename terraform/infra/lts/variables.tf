
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
