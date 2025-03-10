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
  project     = var.project_id
  region      = var.region
  credentials = file("/home/runner/work/${var.terraform_repo_path}/gcp-key.json")
}

# Load network module (Optional: if you have a network.tf)
module "network" {
  source = "./network"
}

# Load broker modules
module "broker1" {
  source                = "./instances/kafka-brokers/instance-broker1"
  instance_names        = var.instance_names
  zones                 = var.zones
  tags                  = var.tags
  subnet                = var.subnet
  instance_type         = var.instance_type
  image                 = var.image
  disk_size             = var.disk_size
  service_account_email = var.service_account_email
}

module "broker2" {
  source                = "./instances/kafka-brokers/instance-broker2"
  instance_names        = var.instance_names
  zones                 = var.zones
  tags                  = var.tags
  subnet                = var.subnet
  instance_type         = var.instance_type
  image                 = var.image
  disk_size             = var.disk_size
  service_account_email = var.service_account_email
}

module "broker3" {
  source                = "./instances/kafka-brokers/instance-broker3"
  instance_names        = var.instance_names
  zones                 = var.zones
  tags                  = var.tags
  subnet                = var.subnet
  instance_type         = var.instance_type
  image                 = var.image
  disk_size             = var.disk_size
  service_account_email = var.service_account_email
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
