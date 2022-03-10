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

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "root"
      host     = "terra-server"
      private_key = "${file("~/.ssh/id_rsa")}"
      timeout     = "2m"
    }

    inline = [
    "apt update",
    "apt -y install nginx",
    "rm -rf /var/www/html/*",
    "exit 0"]

  }
  provisioner "file" {
    source      = "/home/afanaskin/terraform/index.html"
    destination = "/var/www/html/index.html"

    connection {
      type     = "ssh"
      user     = "root"
      host     = "terra-server"
      private_key = "${file("~/.ssh/id_rsa")}"
      timeout     = "2m"
    }
  }
}


