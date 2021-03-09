# (.var.vpc_id) - resource : aws_subnet, childmodule/main.tf
variable "vpc_id" {
  type = string
  description = "VPC Id"
}

# (.var.cidr_block) - resource : aws_subnet, childmodule/main.tf 
variable "cidr_block" {
  type = string
  description = "Subent cidr block"
}

# (.var.ami) - resource : aws_instance, childmodule/main.tf
variable "ami" {
  type = string
  description = "This is ami for instance"
}

# (.var.instance_type) - resource : aws_instance, childmodule/main.tf 
variable "instance_type" {
  type = string
  description = "Instance_type"
}

# (.var.webserver_name) - resource : aws_instance, childmodule/main.tf 
variable "webserver_name" {
  type = string
  description = "Web server name"
}
