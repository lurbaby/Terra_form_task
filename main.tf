
module "ec2_module" {
  source = "./ec2_module"
  security_group_id = module.sg_module.security_group_id
}

module "sg_module"{
  source = "./sg_module"
}

module "s3_module" {
  source = "./s3_module"

}




resource "random_password" "pass" {
  length  = "14"
  special = true
  # override_special переписати на нові 
  
}

data "aws_caller_identity" "my_user"{
}






# resource "aws_security_group" "default_group" {
  
#   ingress {
#     description      = "HTTPS"
#     from_port        = 443
#     to_port          = 443
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   ingress {
#     description      = "HTTP"
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }
  
#   ingress {
#     description      = "SSH"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "default_group"
#   }
# }