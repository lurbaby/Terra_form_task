resource "aws_instance" "web" {
  ami             = var.ami
  instance_type   = var.instance_type
  vpc_security_group_ids = [var.security_group_id]
  #vpc_security_group_ids -> security_group   
  key_name = var.key_name
  subnet_id = var.subnet_id 

  associate_public_ip_address = true
  #install docker+docker-compose
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              
              sudo apt-get install -y docker.io

              sudo systemctl start docker
              sudo systemctl enable docker

              sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              sudo chmod +x /usr/local/bin/docker-compose
              
              SECRET_NAME="test_1"
              REGION="eu-central-1"
              SECRET=$(aws secretsmanager get-secret-value --secret-id $SECRET_NAME --region $REGION --query SecretString --output text)
              echo "SECRET=$SECRET" > /home/ubuntu/.env
              EOF
    
    iam_instance_profile = var.iam_instance_profile

    

  tags = {
    Name = "helloWorld"
  }
}