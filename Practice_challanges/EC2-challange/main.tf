resource "aws_instance" "Webserver" {
  instance_type = "t2.micro"
  ami           = "ami-0915bcb5fa77e4892"
  user_data = file("userdata.sh")
  security_groups = [ aws_security_group.terraformSG.name ]
  tags = {
    "Name" = "EC2 webserver"
  }
}

variable "ingress"{
  type = list(number)
  default = [80,443]
}                                       
variable "egress"{
  type = list(number)
  default = [80,443]
}                                               

resource "aws_security_group" "terraformSG" {
  name        = "webserverSG"
  description = "This webserver SG"
  
dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    content {
     from_port = port.value
     to_port = port.value
     protocol = "TCP"
     cidr_blocks = ["0.0.0.0/0"]
    }
  }
dynamic "egress" {
    iterator = port
    for_each = var.egress
    content {
     from_port = port.value
     to_port = port.value
     protocol = "TCP"
     cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_instance" "Database" {
  instance_type = "t2.micro"
  ami           = "ami-0915bcb5fa77e4892"
  tags = {
    "Name" = "EC2 Database"
  }
}

resource "aws_eip" "webserver-EIP" {
  instance = aws_instance.Webserver.id
  }