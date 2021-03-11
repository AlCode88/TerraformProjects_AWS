variable "env" {
  description = "Name of the environment"
  type = string
  default = "dev" # if you dont specify default it will not prompt the value 
}

variable "instance_type" {
  type = string
  description = "Instance type"
  default = "t2.micro"
}