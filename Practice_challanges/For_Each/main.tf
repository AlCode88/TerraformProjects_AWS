resource "aws_instance" "For_Each_instances" {
  for_each = {
    database = "t2.micro"
    webserver = "t2.micro"
  }
  instance_type = each.value
  ami = "ami-0915bcb5fa77e4892"
  tags = {
    "Name" = "EC2 - ${each.key}"
  }
}
resource "aws_eip" "webserver-EIP" {
  instance = aws_instance.For_Each_instances["webserver"].id
  tags = {
    "Name" = "webserver-EIP"
  }
}

output "webserver_IP" {
    value =aws_instance.For_Each_instances["webserver"].public_ip
}
