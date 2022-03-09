variable "ext_ip" {
  description = "External_ip"
  default = "google_compute_instance.terra-server.network_interface.0.access_config.0.nat_ip"
}