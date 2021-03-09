# 8  Assign An Elastic IP to the Network Interface Created in step 7 
resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.terraform_network_interface.id
  associate_with_private_ip = "10.0.1.50"
  depends_on                = [aws_internet_gateway.terraform_project1_Internet_Gateway]
}

output "aws-eip" {
  value = aws_eip.one.id
}

