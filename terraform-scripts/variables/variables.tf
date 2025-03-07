variable "region" {
  type = string
  default     = "us-east1"
}

variable "instance_type" {
  type = string
  default     = "n2-standard-4"
}

variable "subnet" {
  type = string
  default     = "projects/reflected-oath-452112-d0/regions/us-east1/subnetworks/default"
}

variable "image" {
  type = string
  default     = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20250228"
}

variable "disk_size" {
  type = string
  default     = 30
}

variable "service_account_email" {
  type = string
  default     = "223009192248-compute@developer.gserviceaccount.com"
}

variable "instance_names" {
  type = map(string)
  default = {
    broker1 = "kafka-broker-1"
    broker2 = "kafka-broker-2"
    broker3 = "kafka-broker-3"
  }
}

variable "zones" {
  type = map(string)
  default = {
    broker1 = "us-east1-b"
    broker2 = "us-east1-c"
    broker3 = "us-east1-d"
  }
}

variable "tags" {
  type = map(list(string))
  default = {
    broker1 = ["kafka-broker", "lb-health-check", "monitoring"]
    broker2 = ["kafka-broker", "lb-health-check", "monitoring"]
    broker3 = ["kafka-broker", "lb-health-check", "monitoring"]
  }
}
