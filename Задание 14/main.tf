terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.13.0"
    }
  }
}

provider "google" {
  credentials = file("mygcp-creds.json")
  project = "vivid-access-338815"
  region = "europe-north1 (Finland)"
  zone = "europe-north1-b"
}

resource "google_compute_instance" "my-terra-server" {
  name = "terra-server-01"
  machine_type = "e2-standard-4"
  boot_disk {
    initialize_params {
      image = "Ubuntu 20.04 LTS"
    }
  }

    network_interface {
      network = "default"
    }
}