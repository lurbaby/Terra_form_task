variable name {
    default     = "default_group"
}
variable vpc_id{
    default      = "vpc-060de73c8ae831086"
    
}
variable ami {
    default ="ami-06dd92ecc74fdfb36"
 
}

variable instance_type {
    default = "t2.micro"
}

variable subnet_id{
    default = "subnet-0d0bbdd2392f95a9b" 

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