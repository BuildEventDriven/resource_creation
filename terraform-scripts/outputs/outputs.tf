output "instance_names" {
  value = [for instance in google_compute_instance.kafka_broker : instance.name]
}

output "instance_ips" {
  value = [for instance in google_compute_instance.kafka_broker : instance.network_interface.0.network_ip]
}
