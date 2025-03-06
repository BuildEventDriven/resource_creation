resource "google_compute_instance" "kafka_template" {
  name         = var.instance_name
  machine_type = var.instance_type
  zone         = "${var.region}-b"

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
    startup-script = "#!/bin/bash\n\n# Check if Kafka is installed\nif systemctl list-units --type=service | grep -q kafka; then\n    echo \"Kafka is installed. Starting Kafka...\"\n    sudo systemctl start kafka\nelse\n    echo \"Kafka is NOT installed. Skipping startup.\"\nfi"
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

  tags = ["kafka-broker", "lb-health-check"]
}
