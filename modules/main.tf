provider "aws" {
  region = "us-east-1"
}

module "backupstorage" {
  source      = "./backupstorage"
  bucket_name = "ritik-backup-bucket"
  environment = "dev"
}

module "imagestorage" {
  source      = "./imagestorage"
  bucket_name = "ritik-image-bucket"
  environment = "dev"
}

module "logstorage" {
  source      = "./logstorage"
  bucket_name = "ritik-log-bucket"
  environment = "dev"
}
