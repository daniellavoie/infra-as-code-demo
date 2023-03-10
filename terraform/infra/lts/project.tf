resource "google_project" "project" {
  folder_id       = local.project_folder
  name            = local.project_name
  project_id      = local.project_id
  billing_account = local.project_billing_account_id
}

resource "google_project_service" "project_services" {
  for_each = toset(local.apis)
  project  = local.project_id
  service  = each.key

  depends_on = [google_project.project]
}

locals {
  apis                       = var.apis
  project_billing_account_id = var.project_billing_account_id
  project_folder             = var.project_folder_id
  project_id                 = var.project_id
  project_name               = var.project_name
}
