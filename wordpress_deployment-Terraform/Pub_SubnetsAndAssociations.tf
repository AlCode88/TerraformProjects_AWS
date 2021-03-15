################### PUBLIC SUBNETS #################

################## 1 SUBNET 1 ######################
# Public Subnet1
resource "aws_subnet" "Public-subnet-1" {
  vpc_id            = aws_vpc.WP-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Pubic_subnet1"
  }
}

################## 2 SUBNET 2 ######################
# Public Subnet 2
resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.WP-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Public_subnet2"
  }
}

################## 3 SUBNET  3 ######################
# Public Subnet 3
resource "aws_subnet" "public3" {
  vpc_id     = aws_vpc.WP-vpc.id
  cidr_block = "10.0.6.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "Public_subnet3"
  }
}