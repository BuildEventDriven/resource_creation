module "broker1" {
  source         = "./terraform-scripts/instances/kafka-brokers"
  instance_name  = "kafka-broker-1"
}

module "broker2" {
  source         = "./terraform-scripts/instances/kafka-brokers"
  instance_name  = "kafka-broker-2"
}

module "broker3" {
  source         = "./terraform-scripts/instances/kafka-brokers"
  instance_name  = "kafka-broker-3"
}
