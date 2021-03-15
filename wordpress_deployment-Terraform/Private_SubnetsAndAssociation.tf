###################### PRIVATE SUBNETS ######################

################ 1 PRIVATE SUBNET AND ASSOCITAION 1 ##########
# Private Subnet 1
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.WP-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Private_subent1"
  }
}
# Private Subnet association 1
resource "aws_route_table_association" "Private-subnet1" {
  route_table_id = aws_route_table.private-RT.id
  subnet_id =aws_subnet.private1.id
}
###########################################################

################ 2 PRIVATE SUBNET AND ASSOCITAION 2 ##########
# Private Subnet 2
resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.WP-vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private_subent2"
  }
}
# Private Subnet association 2
resource "aws_route_table_association" "Private-subnet2" {
  route_table_id = aws_route_table.private-RT.id
  subnet_id =aws_subnet.private2.id
}
############################################################

###########################################################

################ 3 PRIVATE SUBNET AND ASSOCITAION 3 ##########
# Private Subnet 3
resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.WP-vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "Private_subent3"
  }
}
# Private Subnet association 3
resource "aws_route_table_association" "Private-subnet3" {
  route_table_id = aws_route_table.private-RT.id
  subnet_id =aws_subnet.private3.id
}
############################################################