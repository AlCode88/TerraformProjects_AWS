########################## VPC ###############################################
# Internet VPC
resource "aws_vpc" "ASG_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "ASG_vpc"
  }
}

# Subnets
resource "aws_subnet" "ASG_Public_subnet1" {
  vpc_id                  = aws_vpc.ASG_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-east-1a"

  tags = {
    Name = "asg_subnet_public_1a"
  }
}

resource "aws_subnet" "ASG_Public_subnet2" {
  vpc_id                  = aws_vpc.ASG_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-east-1b"

  tags = {
    Name = "asg_subnet_public_1b"
  }
}

resource "aws_subnet" "ASG_Public_subnet3" {
  vpc_id                  = aws_vpc.ASG_vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-east-1c"

  tags = {
    Name = "asg_subnet_public_1c"
  }
}

# Internet GW
resource "aws_internet_gateway" "ASG_vpc" {
  vpc_id = aws_vpc.ASG_vpc.id

  tags = {
    Name = "ASG_igw"
  }
}

# route tables
resource "aws_route_table" "Public_Route_Table" {
  vpc_id =  aws_vpc.ASG_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ASG_vpc.id
  }

  tags = {
    Name = "ASG_Public_RT"
  }
}

# route associations public
resource "aws_route_table_association" "main-public-1-a" {
  subnet_id      = aws_subnet.ASG_Public_subnet1.id
  route_table_id = aws_route_table.Public_Route_Table.id
}

resource "aws_route_table_association" "main-public-2-a" {
  subnet_id      = aws_subnet.ASG_Public_subnet2.id
  route_table_id = aws_route_table.Public_Route_Table.id
}

resource "aws_route_table_association" "main-public-3-a" {
  subnet_id      = aws_subnet.ASG_Public_subnet3.id
  route_table_id = aws_route_table.Public_Route_Table.id
}
