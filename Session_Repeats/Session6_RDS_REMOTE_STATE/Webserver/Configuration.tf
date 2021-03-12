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

# Data Source for the AMI
data "aws_ami" "DataSource_ForAMI" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["CustomImage"]
  }
}
# DataSource for the template file
data "template_file" "DataSource_templateFile" {
  template = file("userdata.sh")
  vars = {
    env = var.env
    address = data.terraform_remote_state.rds.outputs.address
    username = data.terraform_remote_state.rds.outputs.username
  }
}
# Webserver Security Group 
resource "aws_security_group" "WebserverSG" {
  name        = "${var.env}-WebeserverSG"
  description = "Allow http traffic"

  tags = {
    Name = "${var.env}-WebeserverSecurityGroup"
  }
}

# Webserver Security Group Rule
resource "aws_security_group_rule" "http_from_alb" {
  description = "this is ingress rule for the alb"
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.ALB-SG.id
  security_group_id        = aws_security_group.WebserverSG.id
}
resource "aws_security_group_rule" "egress_webserver" {
  description = "this is egress rule for the alb"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.WebserverSG.id
}

# AWS Launch Configuratio
resource "aws_launch_configuration" "webserver_LaunchConfiguration" {
  name_prefix   = "${var.env}-Webserver_LaunchConfiguration"
  image_id      = data.aws_ami.DataSource_ForAMI.image_id
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }

  user_data       = data.template_file.DataSource_templateFile.rendered
  security_groups = [aws_security_group.WebserverSG.id]
}