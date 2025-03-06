module "broker1" {
  source         = "./instances/kafka-brokers"
  instance_name  = "kafka-broker-1"
}

module "broker2" {
  source         = "./instances/kafka-brokers"
  instance_name  = "kafka-broker-2"
}

module "broker3" {
  source         = "./instances/kafka-brokers"
  instance_name  = "kafka-broker-3"
}