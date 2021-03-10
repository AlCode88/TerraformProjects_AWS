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
  user_data = <<EOF
  #!/bin/bash
sudo su
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World from $(hostname -f)" > /var/www/html/index.html
  EOF
  tags = {
    Name = "First-instance"
    Environment = var.env # variable
  }
}

resource "aws_security_group" "SecurityGroup1" {
  name        = "Terraform Security Group1"
  description = "Allow http traffic"

# ONE WAY OF DEFINING SECURITY GROUP
#  ingress {
#    description = "Allow http"
#    from_port   = 80                   # From port allows you to make ports open from  To port allows you to open ports to but
#    to_port     = 80                  # if you want to specify only one port it is from and to the same port number.
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  egress {
#    from_port   = 0                     # if you put "0" that means it is open to everyone
#    to_port     = 0
#    protocol    = "-1"                  # "-1" means all protocols
#    cidr_blocks = ["0.0.0.0/0"]
#  }
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