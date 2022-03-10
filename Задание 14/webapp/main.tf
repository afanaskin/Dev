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


resource "google_compute_instance" "terra-server" {
  name = "terra-server"
  machine_type = "e2-standard-4"
  boot_disk {
    initialize_params {
      size  = "15"
      image = "ubuntu-2004-focal-v20220303a"
    }
  }
  network_interface {
    network = "default"
    access_config {
      }
    }

  metadata = {
    ssh-keys = "root:${file("/home/afanaskin/terraform/id_rsa.pub")}"
  }

  metadata_startup_script = "apt update, apt install -y default-jdk, apt install -y git, apt install -y maven, mkdir /home/git, git clone https://github.com/deepshankaryadav/CyberFRAT-DevSecOps-Training-Sample-Java-App.git /home/git, cd /home/git, cd /home/git && mvn package"

}


