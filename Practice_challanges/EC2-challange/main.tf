resource "aws_instance" "Webserver" {
  instance_type = "t2.micro"
  ami           = "ami-0915bcb5fa77e4892"
  tags = {
    "Name" = "EC2 webserver"
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
  vpc      = true
}

output "databaseIP" {
  value = aws_instance.Webserver.public_ip
}
output "webserverIP" {
  value = aws_instance.Database.id
}
output "EIP" {
  value = aws_eip.webserver-EIP.public_ip
}