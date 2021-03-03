terraform {
  required_version = "~> 0.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.25.0"
    }
  }
}
# Create a VPC
resource "aws_vpc" "TB-VPC" {
  cidr_block = "192.168.0.0/24"
  tags = {
    "Name" = "terraform_practice"
  }
}