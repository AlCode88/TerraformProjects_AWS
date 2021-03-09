# This is variable for the module in main.tf resource subnet
# for the vpc-id
variable "vpc_id" {
  type = string
  description = "VPC Id"
}

# This is variable for the subnet cidr block, module/main.tf 
variable "cidr_block" {
  type = string
  description = "Subent cidr block"
}

# Varibale for the ami in module/main.tf resource instance.
variable "ami" {
  type = string
  description = "This is ami for instance"
}

# variable for the instance_type for module/main.tf resource instance. 
variable "instance_type" {
  type = string
  description = "Instance_type"
}

# variable for the instance_tags module/main.tf resource instance 
variable "webserver_name" {
  type = string
  description = "Web server name"
}
