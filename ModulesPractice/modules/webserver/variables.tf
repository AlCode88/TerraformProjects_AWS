variable "vpc_id" {
   type = string
   description = "Vpc Id"
}
variable "cidr_block" {
   type = string
   description = "subnet cidr block"
}
variable "webserve_name" {
   type = string
   description = "Name of the webserver "
}
variable "ami" {
   type = string
   description = "ami to use on the webserver"
}
variable "instance_type" {
   type = string
   description = "Instance type"
   default = "t2.micro"
}