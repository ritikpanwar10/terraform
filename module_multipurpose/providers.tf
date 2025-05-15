provider "aws" {
  alias  = "useast1"
  region = var.region_log
}

provider "aws" {
  alias  = "uswest1"
  region = var.region_backup
}

provider "aws" {
  alias  = "apnortheast1"
  region = var.region_static
}
