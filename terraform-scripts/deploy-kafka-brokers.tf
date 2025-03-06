module "broker1" {
  source         = "./instances/kafka-brokers/kafka-broker-1"
}

module "broker2" {
  source         = "./instances/kafka-brokers/kafka-broker-2"
}

module "broker3" {
  source         = "./instances/kafka-brokers/kafka-broker-3"
}