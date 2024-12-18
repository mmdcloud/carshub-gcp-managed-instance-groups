# VPC
resource "google_compute_network" "carshub_vpc" {
  name                    = "carshub-vpc"
  auto_create_subnetworks = false
}

# backend subnet
resource "google_compute_subnetwork" "carshub_subnet" {
  name          = "carshub-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.location
  network       = google_compute_network.carshub_vpc.id
}

# allow access from health check ranges
resource "google_compute_firewall" "carshub_firewall" {
  name          = "carshub-firewall"
  direction     = "INGRESS"
  network       = google_compute_network.carshub_vpc.id
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "tcp"
    ports    = ["3000"]
  }
  target_tags = ["carshub-backend-health-check", "carshub-frontend-health-check"]
}