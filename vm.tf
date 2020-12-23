data "google_compute_zones" "available" {}

resource "google_compute_instance" "default" {
  project      = local.project_name
  zone         = data.google_compute_zones.available.names[0]
  name         = "tf-compute-1"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    subnetwork = "simple-gcp-subnet-01"
    access_config {
    }
  }
}
