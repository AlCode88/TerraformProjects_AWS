resource "aws_instance" "instance1" {
  ami           = "ami-0742b4e673072066f" # us-west-2
  instance_type = "t2.micro"
  tags = {
    Name = "TerraformInstance"
  }
}
provider "aws" {
    region = "us-east-1"
}