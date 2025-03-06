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
  project = "BuildEventDriven"
  region  = var.region
}

# Call broker1 as a module
module "broker1" {
  source         = "./instances/kafka-brokers/broker1"
  instance_names = var.instance_names
  zones          = var.zones
  tags           = var.tags
}

module "broker2" {
  source         = "./instances/kafka-brokers/broker2"
  instance_names = var.instance_names
  zones          = var.zones
  tags           = var.tags
}

module "broker3" {
  source         = "./instances/kafka-brokers/broker3"
  instance_names = var.instance_names
  zones          = var.zones
  tags           = var.tags
}

output "broker_instances" {
  value = {
    broker1 = module.broker1.instance_name
    broker2 = module.broker2.instance_name
    broker3 = module.broker3.instance_name
  }
}

output "broker_ips" {
  value = {
    broker1 = module.broker1.instance_ip
    broker2 = module.broker2.instance_ip
    broker3 = module.broker3.instance_ip
  }
}
