variable name {
    default     = "default_group"
}
variable "vpc_id"{
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


variable user_data_install_docker {

    default =<<-EOF
            #!/bin/bash
              sudo apt-get update -y
              
              sudo apt-get install -y docker.io

              sudo systemctl start docker
              sudo systemctl enable docker

              sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              sudo chmod +x /usr/local/bin/docker-compose
              EOF

}

variable "security_group_id"{
    type = string

}