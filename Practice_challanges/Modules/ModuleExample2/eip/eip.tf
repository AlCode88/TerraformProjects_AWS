# AWS EIP 
resource "aws_eip" "webserver-EIP" {
  instance = var.instance_id
  }

# Output for the EIP resource
output "webserver_publicIP" {
  value = aws_eip.webserver-EIP.public_ip
}
# Variable for the instance id
variable "instance_id" {
  type = string
}