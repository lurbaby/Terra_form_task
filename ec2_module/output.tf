output instance_ip_addr {
  value = aws_instance.web.public_ip
}

output subnet_id{
    value = var.subnet_id

}
output vpc_id{
    value = var.vpc_id
    
}