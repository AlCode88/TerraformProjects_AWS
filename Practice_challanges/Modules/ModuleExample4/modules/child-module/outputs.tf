# Outputs
output "instance" {
  value = aws_instance.module_instance.id
  description = "Webserver-outputf"
}
