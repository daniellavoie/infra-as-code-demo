data "google_iam_policy" "policies" {
  for_each = toset(var.terraform_roles)

  binding {
    role = each.key

    members = [
      "serviceAccount:${google_service_account.service_account.email}",
    ]
  }
}

resource "google_service_account" "service_account" {
  account_id   = "terraform"
  project_id   = local.project_id
  display_name = "Terraform Service Account"
}

resource "google_service_account_iam_policy" "service_account" {
  for_each = data.google_iam_policy.policies

  service_account_id = google_service_account.service_account.name
  policy_data        = each.value.policy_data
}

resource "google_service_account_key" "service_account" {
  service_account_id = google_service_account.service_account.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

locals {
  project_id = var.project_id
  roles      = var.terraform_roles
}
