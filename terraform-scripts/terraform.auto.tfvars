project_id            = "buildeventdriven"
region                = "us-east1"
instance_type         = "n2-standard-4"
subnet                = "projects/reflected-oath-452112-d0/regions/us-east1/subnetworks/default"
image                 = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20250228"
disk_size             = 30
service_account_email = "teraform-create-manage@buildeventdriven.iam.gserviceaccount.com"
terraform_repo_path   = "resource_creation/resource_creation/terraform-scripts"

instance_names = {
  broker1 = "kafka-broker-1"
  broker2 = "kafka-broker-2"
  broker3 = "kafka-broker-3"
}

zones = {
  broker1 = "us-east1-b"
  broker2 = "us-east1-c"
  broker3 = "us-east1-d"
}

tags = {
  broker1 = ["kafka-broker", "lb-health-check", "monitoring"]
  broker2 = ["kafka-broker", "lb-health-check", "monitoring"]
  broker3 = ["kafka-broker", "lb-health-check", "monitoring"]
}
