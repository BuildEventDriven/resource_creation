module "broker$i" {
  source            = "./terraform-scripts/instances/kafka-brokers/instance-template.tf"
  instance_name     = "kafka-broker-$i"
}
