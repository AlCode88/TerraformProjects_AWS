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

resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "module-subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = aws_vpc.main.cidr_block
}

resource "aws_instacne" "module_instance" {
 ami = "ami-047a51fa27710816e"
 instance_type = "t2.micro"
 subnet_id = aws_subnet.module-subnet.id
 tags = {
     Name = "new_name"
 }
}