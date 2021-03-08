# Create Custom Route Table
resource "aws_route_table" "terraform_project1_Route_Table" {
  vpc_id = aws_vpc.terraform_project1_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_project1_Internet_Gateway.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.terraform_project1_Internet_Gateway.id
  }

  tags = {
    Name = "Terraform_Route_Table"
  }
}