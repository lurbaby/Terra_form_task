output instance_ip_addr {
  value = aws_instance.web.public_ip
}
output ami {
  value = var.ami
}
output instance_type{
  value = var.instance_type
}

output subnet_id{
    value = var.subnet_id

}
output vpc_id{
    value = var.vpc_id
    
}