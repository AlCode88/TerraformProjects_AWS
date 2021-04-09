provider "aws" {
 region = "us-west-1"
}

resource "aws_instance" "Webserver" {
  instance_type = "t2.micro"
  ami           = "ami-0915bcb5fa77e4892"
  user_data = file("userdata.sh")
  security_groups = [ aws_security_group.taskSG.name ]
  tags = {
    "Name" = "Web_instance"
  }
}


