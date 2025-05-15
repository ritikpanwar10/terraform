module "logstorage" {
  source      = "./modules/logstorage"
  bucket_name = var.log_bucket_name
  providers = {
    aws = aws.useast1
  }
}

module "backstorage" {
  source      = "./modules/backstorage"
  bucket_name = var.backup_bucket_name
  providers = {
    aws = aws.uswest1
  }
}

module "staticfiles" {
  source      = "./modules/staticfiles"
  bucket_name = var.static_files_bucket_name
  providers = {
    aws = aws.apnortheast1
  }
}
