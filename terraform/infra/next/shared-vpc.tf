resource "google_compute_shared_vpc_service_project" "service" {
  host_project    = local.host_project
  service_project = "service-project-id-1"
}

locals {
  host_project = var.host_project
}