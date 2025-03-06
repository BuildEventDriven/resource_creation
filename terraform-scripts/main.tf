terraform {
  required_version = ">= 1.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = "your-gcp-project-id"
  region  = var.region
}

module "broker1" {
  source = "./instances/kafka-brokers/instance-broker1.tf"
}

module "broker1" {
  source = "./instances/kafka-brokers/instance-broker2.tf"
}

module "broker1" {
  source = "./instances/kafka-brokers/instance-broker3.tf"
}

output "broker_instances" {
  value = {
    broker1 = google_compute_instance.kafka_broker_1.name
    broker2 = google_compute_instance.kafka_broker_2.name
    broker3 = google_compute_instance.kafka_broker_3.name
  }
}

output "broker_ips" {
  value = {
    broker1 = google_compute_instance.kafka_broker_1.network_interface.0.network_ip
    broker2 = google_compute_instance.kafka_broker_2.network_interface.0.network_ip
    broker3 = google_compute_instance.kafka_broker_3.network_interface.0.network_ip
  }
}
