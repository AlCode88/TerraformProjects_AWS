resource "aws_instance" "terraformEC2" {
 instance_type = "t2.micro"
 ami = "ami-0915bcb5fa77e4892"
 tags = {
   "Name" = "TerraformEC2"
 }
}

resource "aws_eip" "terraform_eip" {
instance = aws_instance.terraformEC2.id
  vpc      = true
  tags = {
    "Name" = "terraformEIP"
  }
}

output "EIP" {
  value = aws_eip.terraform_eip.public_ip
}