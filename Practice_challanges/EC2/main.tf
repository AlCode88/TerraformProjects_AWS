resource "aws_instance" "terraformEC2" {
 instance_type = "t2.micro"
 ami = "ami-0915bcb5fa77e4892"
}