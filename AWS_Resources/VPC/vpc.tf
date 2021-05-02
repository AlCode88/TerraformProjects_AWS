# AWS_resource_vpc
resource "aws_vpc" "aws_resource_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default" # This means you can have an multiple instances on the same physicall rack.
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "aws_resource_vpc"
  }
}

# Public Subnet
resource "aws_subnet" "Public_subnets" {
  count             = 3
  vpc_id            = aws_vpc.aws_resource_vpc.id
  cidr_block        = element(var.Public_subnet_cidr, count.index)
  availability_zone = element(var.Subnet_AZs, count.index)
  
  tags = {
    Name = "${var.env}-Public_Subnet${count.index}"
    ENV = "${var.env}-${count.index}"
    Project = "var.vpc_tag${count.index}"
  }
}

# Private Subent
resource "aws_subnet" "Private_subnets" {
  count             = 3
  vpc_id            = aws_vpc.aws_resource_vpc.id
  cidr_block        = element(var.Private_subnet_cidr, count.index)
  availability_zone = element(var.Subnet_AZs, count.index)
  
  tags = {
    Name = "${var.env}-Private_Subnet${count.index}"
    ENV = "${var.env}-${count.index}"
    Project = "var.vpc_tag${count.index}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "aws_resource_igw" {
  vpc_id = aws_vpc.aws_resource_vpc.id
  tags = {
    Name = "${var.env}-IGW"
    Env  = var.env
    Project = var.vpc_tag
  }
}

# Public Route Table
resource "aws_route_table" "aws_resource_public_RT" {
  vpc_id = aws_vpc.aws_resource_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_resource_igw.id
  }

  tags = {
    Name = "${var.env}-Public_Route_Table"
  }
}

# Private Route Table
resource "aws_route_table" "aws_resource_private_RT" {
  vpc_id = aws_vpc.aws_resource_vpc.id

  route {
    cidr_block     ="0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.aws_resource_nat_gtw.id
  }
  
  tags = {
    Name = "${var.env}-Private_Route_Table"
  }
}
# This is Public route Table Association
resource "aws_route_table_association" "Public_Route_Table_association" {
  count          = 3
  subnet_id      = element(aws_subnet.Public_subnets.*.id, count.index)
  route_table_id = aws_route_table.aws_resource_public_RT.id
}

# This is Private Subnet Association
resource "aws_route_table_association" "Private_Route_Table_association" {
  count          = 3
  subnet_id      = element(aws_subnet.Private_subnets.*.id, count.index)
  route_table_id = aws_route_table.aws_resource_private_RT.id
}

# This is NatGateway 
resource "aws_nat_gateway" "aws_resource_nat_gtw" {
  allocation_id = aws_eip.NAT-eip.id
  subnet_id     = aws_subnet.Public_subnets.0.id
  depends_on    = [aws_internet_gateway.aws_resource_igw]
  tags = {
    Name = "${var.env}-Nat_gateway"
  }
}

# This NatGateway EIP
resource "aws_eip" "NAT-eip" {
  vpc = true
  tags = {
    Name = "${var.env}-Nat_Gateway_EIP"
    ENV = var.env
    Project = var.vpc_tag
  }
}