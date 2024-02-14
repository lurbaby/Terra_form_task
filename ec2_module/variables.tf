variable name {
    default     = "lurbaby"
}
variable vpc_id{
    default      = "vpc-0d6e69ecc0101901d"
    
}
variable ami {
    default ="ami-0faab6bdbac9486fb"
  
}

variable instance_type {
    default = "t2.micro"
}

variable subnet_id{
    default = "subnet-0977cf3277542ac72" 

}

variable key_name {
    default = "kali_main_rsa_aws"
}




variable security_group_id{
    type = string

}

variable "iam_instance_profile"{
    type = string
}