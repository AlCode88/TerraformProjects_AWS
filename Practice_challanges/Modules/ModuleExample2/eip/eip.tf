# AWS EIP 
resource "aws_eip" "webserver-EIP" {
  instance = var.instance_id
  }

output "webserver_publicIP" {
  value = aws_eip.webserver-EIP.public_ip
}

variable "instance_id" {
  type = string
}