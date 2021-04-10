terraform {
  required_version = "~> 0.14.0"
  required_providers {
    aws = {
      version = "3.35.0"
      source  = "hashicorp/aws"
    }
  }
}