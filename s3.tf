provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "ritikpanwar-unique-bucket-name"  # Bucket name must be globally unique
  acl    = "private"

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
  }
}
 