locals {
  subnet_01 = "${var.network_name}-subnet-01"
  subnet_02 = "${var.network_name}-subnet-02"
  subnet_03 = "${var.network_name}-subnet-03"
}

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 2.6"
  project_id   = google_project.project.project_id
  network_name = var.network_name

  subnets = [
    {
      subnet_name   = local.subnet_01
      subnet_ip     = "10.10.10.0/24"
      subnet_region = var.region
    },
    {
      subnet_name           = local.subnet_02
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = var.region
      subnet_private_access = "true"
    }
  ]
}
