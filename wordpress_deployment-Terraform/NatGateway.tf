#  Nat Gateway
resource "aws_nat_gateway" "WP-NatGateway" {
  subnet_id     = aws_subnet.private1.id 
  allocation_id = aws_eip.NAT-eip.id
  depends_on    = [aws_internet_gateway.WP-IGW]
  tags = {
    Name = "WP-natGateway"
  }
}

#  Nat Instance EIP
resource "aws_eip" "NAT-eip" {
  vpc = true
  tags = {
    Name = "Nat_Gateway_EIP"
  }
}