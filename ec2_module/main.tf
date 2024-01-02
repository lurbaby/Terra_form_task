resource "aws_instance" "web" {
  ami             = var.ami
  instance_type   = var.instance_type
  vpc_security_group_ids = [var.security_group_id]
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