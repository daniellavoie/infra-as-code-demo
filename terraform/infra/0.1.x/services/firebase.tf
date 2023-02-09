resource "google_firebase_project" "firebase" {
  provider = google-beta
  project  = local.project_id
}

locals {
  project_id        = var.project_id
}