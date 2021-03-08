
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

module "ec2module" {
    source = "./EC2"
    ec2-name = "Module-Name"
}