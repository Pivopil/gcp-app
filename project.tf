resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

locals {
  project_name = "${var.target_project_name}-${random_string.suffix.result}"
}

resource "google_project" "project" {
  name            = local.project_name
  project_id      = local.project_name
  billing_account = var.billing_account_id
  folder_id       = var.folder_id
}

resource "google_project_service" "service" {
  for_each = toset([
    "compute.googleapis.com"
  ])

  service = each.key

  project            = google_project.project.project_id
  disable_on_destroy = false
}
