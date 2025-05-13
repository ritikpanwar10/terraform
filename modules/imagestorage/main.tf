resource "aws_s3_bucket" "image" {
  bucket = var.bucket_name
  tags = {
    Name        = var.bucket_name
    Environment = var.environment
    Type        = "Image"
  }
}
