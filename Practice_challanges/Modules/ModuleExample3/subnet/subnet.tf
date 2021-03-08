#  Create a Subnet
resource "aws_subnet" "terraform_project1_subnet" {
  vpc_id            = aws_vpc.terraform_project1_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "terraform_project1_subnet"
  }
}

#  Associate Subnet with Route Table
resource "aws_route_table_association" "subnet_associate" {
  subnet_id      = aws_subnet.terraform_project1_subnet.id
  route_table_id = aws_route_table.terraform_project1_Route_Table.id
}