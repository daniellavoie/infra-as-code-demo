resource "google_project" "project" {
  folder_id  = local.project_folder
  name       = local.project_name
  project_id = local.project_id
}

locals {
  project_folder = var.project_folder_id
  project_id     = var.project_id
  project_name   = var.project_name
}
