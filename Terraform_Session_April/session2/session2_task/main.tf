provider "aws" {
 region = "us-west-2"
}

resource "aws_instance" "Webserver" {
  instance_type = var.my_instance_type
  ami           = var.my_ami
  user_data = file("userdata.sh")
  vpc_security_group_ids = [ aws_security_group.taskSG.id ]
  availability_zone = var.my_az
  tags = {
    "Name" = "Web_instance"
  }
}