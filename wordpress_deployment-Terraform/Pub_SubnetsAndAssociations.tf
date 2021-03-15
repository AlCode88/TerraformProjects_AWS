################### PUBLIC SUBNETS ##############################

################## 1 SUBNET AND ASSOCIATION 1 ######################
# Public Subnet1
resource "aws_subnet" "Public-subnet-1" {
  vpc_id            = aws_vpc.WP-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Pubic_subnet1"
  }
}
# Public Subnet association 1
resource "aws_route_table_association" "RT-public-subnet-1" {
  route_table_id = aws_route_table.public-RT.id
  subnet_id = aws_subnet.Public-subnet-1.id
}
###################################################################

################## 2 SUBNET AND ASSOCIATION 2 ######################
# Public Subnet 2
resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.WP-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Public_subnet2"
  }
}
# Public Subnet association 2
resource "aws_route_table_association" "Public-subnet-2" {
  route_table_id = aws_route_table.public-RT.id
  subnet_id = aws_subnet.public2.id
}
###################################################################

################## 3 SUBNET AND ASSOCIATION 3 ######################
# Public Subnet 3
resource "aws_subnet" "public3" {
  vpc_id     = aws_vpc.WP-vpc.id
  cidr_block = "10.0.6.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "Public_subnet3"
  }
}
# Public Subnet association 3
resource "aws_route_table_association" "Public-subnet-3" {
  route_table_id = aws_route_table.public-RT.id
  subnet_id = aws_subnet.public3.id
}
#############################################################