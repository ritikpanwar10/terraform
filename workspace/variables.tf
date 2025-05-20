variable "environment_config" {
  description = "Configuration for different environments"
  type = map(object({
    bucket_name_suffix = string
    versioning_enabled = bool
    bucket_acl        = string
    force_destroy     = bool
  }))
  default = {
    dev = {
      bucket_name_suffix = "-dev-data"
      versioning_enabled = false
      bucket_acl        = "private"
      force_destroy     = true  # Allows bucket deletion with contents
    },
    stage = {
      bucket_name_suffix = "-stage-data"
      versioning_enabled = true
      bucket_acl        = "private"
      force_destroy     = false
    },
    prod = {
      bucket_name_suffix = "-prod-data"
      versioning_enabled = true
      bucket_acl        = "private"
      force_destroy     = false
    }
  }
}

variable "base_bucket_name" {
  description = "Base name for the S3 bucket"
  type        = string
  default     = "my-company"
}