provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "environment_bucket" {
  # Construct bucket name using workspace
  bucket = "${var.base_bucket_name}${var.environment_config[terraform.workspace].bucket_name_suffix}"
  
  acl           = var.environment_config[terraform.workspace].bucket_acl
  force_destroy = var.environment_config[terraform.workspace].force_destroy

  versioning {
    enabled = var.environment_config[terraform.workspace].versioning_enabled 
  }

  tags = {
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
  }
}

# Enable bucket server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.environment_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block public access to the bucket
resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.environment_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}