data "google_iam_policy" "policies" {

  binding {
    for_each = toset(var.terraform_roles)
    role     = each.key

    members = [
      "serviceAccount:${google_service_account.service_account.email}",
    ]
  }
}

resource "google_service_account" "service_account" {
  account_id   = "terraform"
  project      = local.project_id
  display_name = "Terraform Service Account"
}

resource "google_service_account_iam_policy" "service_account" {
  service_account_id = google_service_account.service_account.name
  policy_data        = data.google_iam_policy.policy_data
}

resource "google_service_account_key" "service_account" {
  service_account_id = google_service_account.service_account.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

locals {
  roles = var.terraform_roles
}
