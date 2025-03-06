output "instance_names" {
  value = {
    broker1 = module.broker1.instance_name
    broker2 = module.broker2.instance_name
    broker3 = module.broker3.instance_name
  }
}

output "instance_ips" {
  value = {
    broker1 = module.broker1.instance_ip
    broker2 = module.broker2.instance_ip
    broker3 = module.broker3.instance_ip
  }
}
