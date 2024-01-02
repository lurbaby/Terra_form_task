resource "aws_s3_bucket" "lurbaby_s3"{

    bucket = "mybucket321234234234"

    tags = {
        Name  = "BUCKET"
        Environment = "Dev"
    }

}