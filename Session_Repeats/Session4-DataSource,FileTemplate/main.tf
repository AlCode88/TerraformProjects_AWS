# Terraform configuration
terraform {
  required_version = "~> 0.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.31.0"
    }
  }
}
# Providers configuration
provider "aws" {
  region = "us-east-1"
}
#First instance
resource "aws_instance" "any-custom-name" {
  ami           = "ami-0915bcb5fa77e4892" 
  instance_type = "t2.micro"             
  vpc_security_group_ids = [ aws_security_group.SecurityGroup1.id]
  user_data = data.template_file.DataSource_templateFile.rendered
  tags = {
    Name = "First-${var.env}" 
    Name2 = format ("First -%s", var.env) 
    Environment = var.env # variable.tf
  }
}
# DataSource for the template file
data "template_file" "DataSource_templateFile" {
  template = file("userdata.sh")
  vars = {
    env = var.env
  }
}
# Security Group Resource
resource "aws_security_group" "SecurityGroup1" {
  name        = "Terraform Security Group1"
  description = "Allow http traffic"

tags = {
    Name = "Terraform-SG1"
  }
}
# Security Group Rule 
resource "aws_security_group_rule" "http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.SecurityGroup1.id
}
resource "aws_security_group_rule" "http_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.SecurityGroup1.id
}