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


resource "google_compute_instance" "build-server" {
  name = "build-server"
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

  metadata_startup_script = "${file("/home/afanaskin/terraform/build.sh")}"

}

resource "google_compute_instance" "run-server" {
  name = "run-server"
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

  metadata_startup_script = "${file("/home/afanaskin/terraform/run.sh")}"

}

/*resource "google_storage_bucket_object" "war" {
  name   = "WebApp.war"
  source = "build-server:/home/git/target/WebApp.war"
  bucket = "aiv-bucket-01"
}*/
