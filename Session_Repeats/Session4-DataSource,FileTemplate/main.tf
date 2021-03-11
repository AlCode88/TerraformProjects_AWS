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
# There is an required section in the resource that you need to specify
# For instance required part is ami and instance type.

#First instance
resource "aws_instance" "any-custom-name" {
  ami           = "ami-0915bcb5fa77e4892" # Reuired field
  instance_type = "t2.micro"             # Required field
  vpc_security_group_ids = [ aws_security_group.SecurityGroup1.id]
  # user_data = file ("userdata.sh")
  tags = {
    Name = "First-${var.env}" # wrapp the var.env with ${} so the first can stay and we can reuse the rest.
    Name2 = format ("First -%S", var.env) # "format" fuction does the same as interpolation above.
    Environment = var.env # variable
  }
}

# DataSource for the file template
data "template_file" "DataSource_templateFile" {
  template = file("userdata.sh")
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