output "name_internal_ip" {
  value = google_compute_instance.name.network_interface.0.network_ip
}

output "name_external_ip" {
  value = "${google_compute_instance.name.network_interface.0.access_config.0.nat_ip}"
}

output "name_machine_type" {
  value = google_compute_instance.name.machine_type
}

output "name_cpu_platform" {
  value = google_compute_instance.name.cpu_platform
}