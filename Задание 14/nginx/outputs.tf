output "terra-server_internal_ip" {
  value = google_compute_instance.terra-server.network_interface.0.network_ip
}

output "terra-server_external_ip" {
  value = "${google_compute_instance.terra-server.network_interface.0.access_config.0.nat_ip}"
}