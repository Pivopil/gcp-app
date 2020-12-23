resource "google_compute_instance" "default" {
  project      = google_project.project.project_id
  zone         = "${var.region}-a"
  name         = "tf-compute-1"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = local.subnet_01
    access_config {
    }
  }
}
