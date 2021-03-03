provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/Users/###/.aws/credentials"
  profile                 = "default"
}
provider "aws"{
alias = "west1"
region = "us-west-1"
}

resource "aws_vpc" "module_vpc" {
  cidr_block = "10.0.0.0/16"
}
module "Alcode" {
  source = "../modules/webserve" # Required part
  vpc_id = aws_vpc.module_vpc.id # This is all 
  cidr_block = "10.0.0.0/16"     # variables that we
  webserve_name = "Alcode"       # passing to the 
  ami = "ami-ubuntu"             # modules/webserver/main.tf
  instance_type = "t2.medium"
}

module "Alcode_west-1" {
  source = "../modules/webserve_west-1" # Required part
  providers = {      # this is to set us-west-1 provider
    aws = aws.west1  # aws - providername above, 
  }                  # aws.alias-name
  vpc_id = aws_vpc.module_vpc.id  
  cidr_block = "10.0.0.0/16"    
  webserve_name = "Alcode_west-1"       
  ami = "ami-ubuntu" # whatver in the us-west-1
  instance_type = "t2.medium"
}
