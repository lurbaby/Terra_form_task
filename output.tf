
output "get_name" {
  value = split("/", data.aws_caller_identity.my_user.arn)[1]
}

output "get_pass" {
    value = random_password.pass.result
    sensitive = true
}

output "ec2_ip" {
  value = module.ec2_module.instance_ip_addr

}
output "sg_group" {
  value = module.sg_module.security_group_id 

}
output "iam_instance_profile"{
  value = aws_iam_instance_profile.ec2_secrets_profile.name

}

