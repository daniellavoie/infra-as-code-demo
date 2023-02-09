resource "google_project" "project" {
  name       = local.project_name
  project_id = local.project_id
  folder_id  = local.project_folder
}

locals {
  project_id        = var.project_id
  project_name      = var.project_name
  project_folder    = var.project_folder
}