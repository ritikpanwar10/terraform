variable "region_log" {
  default = "us-east-1"
}

variable "region_backup" {
  default = "us-west-1"
}

variable "region_static" {
  default = "ap-northeast-1"
}

variable "log_bucket_name" {
  description = "Name for the log S3 bucket"
  type        = string
  default     = "ritik-log-bucket-example"
}

variable "backup_bucket_name" {
  description = "Name for the backup S3 bucket"
  type        = string
  default     = "ritik-backup-bucket-example"
}

variable "static_files_bucket_name" {
  description = "Name for the static files S3 bucket"
  type        = string
  default     = "ritik-static-files-bucket-example"
}
