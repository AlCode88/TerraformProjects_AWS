variable "ingress"{
  type = list(number)
  default = [80,443]
}                                       
variable "egress"{
  type = list(number)
  default = [80,443]
}                                               

output "SG-group" {
  value = aws_security_group.terraformSG.id
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

