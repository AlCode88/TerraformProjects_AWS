output "databaseIP" {
  value = aws_instance.Webserver.public_ip
}

output "webserverIP" {
  value = aws_instance.Database.id
}

output "EIP" {
  value = aws_eip.webserver-EIP.public_ip
 }