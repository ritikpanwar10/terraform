provider "aws" {
    region = "us-east-1"
}

// Ensure the IAM user or role executing this Terraform code has the following permissions:
// - s3:PutBucketPolicy
// - s3:GetBucketPolicy
// - s3:ListBucket
// - s3:GetObject
// - s3:PutObject
// Without these permissions, the bucket policy cannot be applied successfully.

resource "aws_s3_bucket" "public_bucket" {
    bucket = "my-unique-public-bucket-ritik-12345" // Bucket name remains unchanged

    tags = {
        Name        = "Public S3 Bucket"
        Environment = "Dev"
    }
}

resource "aws_s3_bucket_acl" "public_bucket_acl" {
    bucket = aws_s3_bucket.public_bucket.id
    acl    = "public-read" // Moved from aws_s3_bucket to this resource
}

resource "aws_s3_bucket_policy" "public_bucket_policy" {
    bucket = aws_s3_bucket.public_bucket.id

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect    = "Allow"
                Principal = "*"
                Action    = "s3:GetObject"
                Resource  = "${aws_s3_bucket.public_bucket.arn}/*"
            }
        ]
    })
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
    bucket = aws_s3_bucket.public_bucket.id

    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}