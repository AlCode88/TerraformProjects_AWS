variable "region" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e" # define the amis that you want to launch
    us-west-2 = "ami-06b94666" # define the amis that you want to launch
    eu-west-1 = "ami-844e0bf7" # define the amis that you want to launch
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "************"   # define the keys
}