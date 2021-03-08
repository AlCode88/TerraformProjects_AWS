resource "aws_instance" "terraformEC2" {
 instance_type = "t2.micro"
 ami = "ami-0915bcb5fa77e4892"
 security_groups = [aws_security_group.terraformSG.name ]
 tags = {
   "Name" = "TerraformPractice"
 }
}
variable "ingress"{
  type = list(number)
  default = [80,443]
}                                       
variable "egress"{
  type = list(number)
  default = [80,443,3306]
}                                               
resource "aws_security_group" "terraformSG" {
  name        = "terraformEC2"
  description = "Ports-80,443,3306"
  
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

tags = {
    Name = "terraformEC2"
  }
}                                                