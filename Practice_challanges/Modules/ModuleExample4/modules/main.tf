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

resource "aws_subnet" "module-subnet" {
  vpc_id = var.vpc.id
  cidr_block = var.cidr_block
}

resource "aws_instacne" "module_instance" {
 ami = var.ami
 instance_type = var.instance_type
 subnet_id = aws_subnet.module-subnet.id
 tags = {
     Name = "${var.webserver_name} webserver"
 }
}