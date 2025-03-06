variable "region" {
  description = "Region for the instances"
  default     = "us-east1"
}

variable "instance_type" {
  description = "Type of instance"
  default     = "n2-standard-4"
}

variable "subnet" {
  description = "Subnet to launch instances in"
  default     = "projects/reflected-oath-452112-d0/regions/us-east1/subnetworks/default"
}

variable "image" {
  description = "VM image"
  default     = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20250228"
}

variable "disk_size" {
  description = "Boot disk size"
  default     = 30
}

variable "service_account_email" {
  description = "Service account email"
  default     = "223009192248-compute@developer.gserviceaccount.com"
}
