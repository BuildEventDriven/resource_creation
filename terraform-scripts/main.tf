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

# Load network module (Optional: if you have a network.tf)
module "network" {
  source = "./network"
}

# Load broker modules
module "broker1" {
  source = "./instances/kafka-brokers/instance-broker1"
}

module "broker2" {
  source = "./instances/kafka-brokers/instance-broker2"
}

module "broker3" {
  source = "./instances/kafka-brokers/instance-broker3"
}

# Output instance names
output "broker_instances" {
  value = {
    broker1 = module.broker1.instance_name
    broker2 = module.broker2.instance_name
    broker3 = module.broker3.instance_name
  }
}

# Output instance IPs
output "broker_ips" {
  value = {
    broker1 = module.broker1.instance_ip
    broker2 = module.broker2.instance_ip
    broker3 = module.broker3.instance_ip
  }
}
