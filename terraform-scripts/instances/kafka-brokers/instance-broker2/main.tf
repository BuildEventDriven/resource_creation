resource "google_compute_instance" "kafka_broker_2" {
  name         = var.instance_names["broker2"]
  machine_type = var.instance_type
  zone         = var.zones["broker2"]

  boot_disk {
    auto_delete = true
    initialize_params {
      image = var.image
      size  = var.disk_size
      type  = "pd-balanced"
    }
    mode = "READ_WRITE"
  }

  network_interface {
    subnetwork = var.subnet
  }

  service_account {
    email  = var.service_account_email
    scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append"
    ]
  }

  metadata = {
    startup-script = <<EOF
  #!/bin/bash

  # Check if Kafka is installed
  if systemctl list-units --type=service | grep -q kafka; then
      echo "Kafka is installed. Starting Kafka..."
      sudo systemctl start kafka
  else
      echo "Kafka is NOT installed. Skipping startup."
  fi
  EOF
  }


  scheduling {
    automatic_restart   = false
    on_host_maintenance = "TERMINATE"
    preemptible         = false
    provisioning_model  = "SPOT"
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags = var.tags["broker2"]
}
output "instance_name" {
value = google_compute_instance.kafka_broker_2.name
}

output "instance_ip" {
value = google_compute_instance.kafka_broker_2.network_interface.0.network_ip
}