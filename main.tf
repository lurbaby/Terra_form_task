
module "sg_module"{
  source = "./sg_module"
}

module "s3_module" {
  source = "./s3_module"

}

module "elb_module"{
  source = "./elb_module"
  

  subnet_id = module.ec2_module.subnet_id
  vpc_id = module.ec2_module.vpc_id
  security_group_id = module.sg_module.security_group_id

}


resource "aws_iam_role" "ec2_secrets_role" {
  name = "ec2-secrets-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "secrets_policy" {
  name        = "secrets-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "secretsmanager:GetSecretValue",
        ],
        Effect = "Allow",
        Resource = "arn:aws:secretsmanager:eu-central-1:288991933989:secret:test_1"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "secrets_policy_attachment" {
  role       = aws_iam_role.ec2_secrets_role.name
  policy_arn = aws_iam_policy.secrets_policy.arn
}

resource "aws_iam_instance_profile" "ec2_secrets_profile" {
  name = "ec2-secrets-profile"
  role = aws_iam_role.ec2_secrets_role.name
}


module "ec2_module" {
  source = "./ec2_module"
  security_group_id = module.sg_module.security_group_id
  iam_instance_profile = var.iam_instance_profile


}


resource "random_password" "pass" {
  length  = "14"
  special = true
  # override_special переписати на нові 
  
}

data "aws_caller_identity" "my_user"{
}
