variable "region" {
  description = "Region for the instances"
  type        = string
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
}

variable "subnet" {
  description = "Subnet to launch instances in"
  type        = string
}

variable "image" {
  description = "VM image"
  type        = string
}

variable "disk_size" {
  description = "Boot disk size"
  type        = number
}

variable "service_account_email" {
  description = "Service account email"
  type        = string
}

variable "instance_names" {
  description = "Map of instance names for brokers"
  type        = map(string)
}

variable "zones" {
  description = "Map of zones for brokers"
  type        = map(string)
}

variable "tags" {
  description = "Map of tags assigned to brokers"
  type        = map(list(string))
}
