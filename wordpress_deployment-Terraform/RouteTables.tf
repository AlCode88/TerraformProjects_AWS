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

# Public Subnet association 1
resource "aws_route_table_association" "RT-public-subnet-1" {
  route_table_id = aws_route_table.public-RT.id
  subnet_id = aws_subnet.Public-subnet-1.id
}

# Public Subnet association 2
resource "aws_route_table_association" "Public-subnet-2" {
  route_table_id = aws_route_table.public-RT.id
  subnet_id = aws_subnet.public2.id
}

# Public Subnet association 3
resource "aws_route_table_association" "Public-subnet-3" {
  route_table_id = aws_route_table.public-RT.id
  subnet_id = aws_subnet.public3.id
}

#################### Private subnet association ###############

# Private Subnet association 1
resource "aws_route_table_association" "Private-subnet1" {
  route_table_id = aws_route_table.private-RT.id
  subnet_id =aws_subnet.private1.id
}
# Private Subnet association 2
resource "aws_route_table_association" "Private-subnet2" {
  route_table_id = aws_route_table.private-RT.id
  subnet_id =aws_subnet.private2.id
}

# Private Subnet association 3
resource "aws_route_table_association" "Private-subnet3" {
  route_table_id = aws_route_table.private-RT.id
  subnet_id =aws_subnet.private3.id
}