# Terraform configuration file
terraform {
  required_version = "~> 0.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.25.0"
    }
  }
}

module "db" {
    source = "./db"
}

module "web" {
    source = "./web"
}

output "db_PrivateIP" {
    value = module.db.db_privateIP
}

output "web_PublicIP" {
    value = module.web.Public_IP
}