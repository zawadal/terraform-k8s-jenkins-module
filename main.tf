terraform {
    backend "s3" {
        bucket = "terraform-myp01-state-bucket"
        key = "terraform-myp01.tfstate"
        region = "eu-central-1"
    }
}

provider "kubernetes" {
    load_config_file = "false"
    host = var.host
    insecure = true
    token = var.token
 }
