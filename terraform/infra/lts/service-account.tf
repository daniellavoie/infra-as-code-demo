resource "google_service_account" "service_account" {
  account_id   = "terraform"
  project      = google_project.project.id
  display_name = "Terraform Service Account"
}

resource "google_project_iam_member" "service_account" {
  for_each = toset(var.terraform_roles)

  project = google_project.project.id
  role    = each.key
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_service_account_key" "service_account" {
  service_account_id = google_service_account.service_account.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

locals {
  roles = var.terraform_roles
}
