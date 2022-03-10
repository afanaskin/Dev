output "run-server_internal_ip" {
  value = google_compute_instance.run-server.network_interface.0.network_ip
}

output "run-server_external_ip" {
  value = "${google_compute_instance.run-server.network_interface.0.access_config.0.nat_ip}"
}