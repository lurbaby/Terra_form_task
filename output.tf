output "instance_ip_addr" {
  value = aws_instance.web.public_ip
}

output "get_name" {
  value = split("/", data.aws_caller_identity.my_user.arn)[1]
}

output "get_pass" {
    value = random_password.pass.result
    sensitive = true
}
