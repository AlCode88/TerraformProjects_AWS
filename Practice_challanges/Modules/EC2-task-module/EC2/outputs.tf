output "WebserverIP" {
  value = aws_instance.Webserver.id
}

output "DatabaseIP" {
  value = aws_instance.Database.id
}

output "EIP" {
  value = aws_eip.webserver-EIP.public_ip
 }