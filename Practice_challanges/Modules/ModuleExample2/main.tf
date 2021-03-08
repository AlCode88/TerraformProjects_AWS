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
# db module
module "db" {
    source = "./db"
}
# output for the db module in the eip resource outputs
output "db_PrivateIP" {
    value = module.db.db_privateIP
}

# web module
module "web" {
    source = "./web"
}
# output for the web module in the web resource outputs
output "web_PublicIP" {
    value = module.web.Public_IP
}