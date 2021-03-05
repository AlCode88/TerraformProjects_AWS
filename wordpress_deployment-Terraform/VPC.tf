#  Create a VPC
resource "aws_vpc" "WP-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "WP-name"
  }
}

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

# Internet Gateway
resource "aws_internet_gateway" "WP-IGW" {
  vpc_id = aws_vpc.WP-vpc.id
  tags = {
    Name = "WP-igw"
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