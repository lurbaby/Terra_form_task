output "instance_ip_addr" {
  value = aws_instance.web.public_ip
}

output "get_name" {
  value = split("/", data.aws_caller_identity.my_user.arn)[1]
}