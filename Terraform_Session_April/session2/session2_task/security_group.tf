# This is dynamic SG variables
variable "ingress" {
type = list (number)
default = [80,22]
}

variable "egress" {
    type = list (number)
    default = [80,22]
}

# Dynamic SG
resource "aws_security_group" "taskSG" {
  name        = "task_session2_SG"
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
