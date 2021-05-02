# Tags variable
variable "env"  {
 type = string
 default = "dev"
}

#This is Private Subnet Cidr
variable "Public_subnet_cidr" {
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

# This is public Subnets cidr range.
variable "Private_subnet_cidr" {
  type = list(string)
  default = ["10.0.11.0/24","10.0.12.0/24","10.0.13.0/24"]
}

# This is public Subnets AZs
variable "Subnet_AZs" { 
    type = list(string)
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

#Project Tags
variable "vpc_tag" {
    type = string
    default = "VPC"
}