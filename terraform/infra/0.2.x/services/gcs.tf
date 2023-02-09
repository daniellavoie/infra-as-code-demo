resource "google_storage_bucket" "bucket" {
  name          = local.bucket_name
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}

locals {
    bucket_name = var.bucket_name
}