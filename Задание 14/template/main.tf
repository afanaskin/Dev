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


resource "google_compute_instance" "name" {
  name = "name"
  #Custom machine types can be formatted as custom-NUMBER_OF_CPUS-AMOUNT_OF_MEMORY_MB, e.g. custom-6-20480 for 6 vCPU and 20GB of RAM
  #There is a limit of 6.5 GB per CPU unless you add extended memory. You must do this explicitly by adding the suffix -ext, e.g. custom-2-15360-ext for 2 vCPU and 15 GB of memory.
  machine_type = "custom-2-4096"
  boot_disk {
    initialize_params {
      #Size in Gbs
      size  = "15"
      image = "ubuntu-2004-focal-v20220303a"
    }
  }
  network_interface {
    network = "default"
    access_config {
      }
    }
}
  /*metadata = {
    ssh-keys = "root:${file("/home/afanaskin/terraform/id_rsa.pub")}"
  }

  metadata_startup_script = "${file("/home/afanaskin/terraform/build.sh")}"

*/

