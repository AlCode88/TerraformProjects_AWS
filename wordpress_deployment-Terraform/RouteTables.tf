#  Public Route Table
resource "aws_route_table" "public-RT" {
  vpc_id = aws_vpc.WP-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.WP-IGW.id
  }
  tags = {
    Name = "public-WP-RT"
  }
}

# Private Route Table
resource "aws_route_table" "private-RT" {
  vpc_id = aws_vpc.WP-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.WP-NatGateway.id
  }

  tags = {
    Name = "private-WP-RT"
  }
}