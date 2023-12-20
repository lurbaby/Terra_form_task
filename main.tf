resource "aws_instance" "web" {
  ami             = var.ami
  instance_type   = var.instance_type
  vpc_security_group_ids = [aws_security_group.default_group.id]
  #vpc_security_group_ids -> security_group   
  key_name = var.key_name
  subnet_id = var.subnet_id 

  associate_public_ip_address = true
  #install docker+docker-compose
  user_data = var.user_data_install_docker

  tags = {
    Name = "helloWorld"
  }
}

resource "random_password" "pass" {
  length  = "14"
  special = true
  # override_special переписати на нові 
  
}



data "aws_caller_identity" "my_user"{
}




resource "aws_security_group" "default_group" {
  
  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "default_group"
  }
}