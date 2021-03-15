###################### PRIVATE SUBNETS #######

################ 1 PRIVATE SUBNET 1 ##########
# Private Subnet 1
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.WP-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Private_subent1"
  }
}

################ 2 PRIVATE SUBNET 2 ##########
# Private Subnet 2
resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.WP-vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private_subent2"
  }
}
############################################

################ 3 PRIVATE SUBNET  3 #######
# Private Subnet 3
resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.WP-vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "Private_subent3"
  }
}