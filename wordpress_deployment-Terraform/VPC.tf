#  Create a VPC
resource "aws_vpc" "WP-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "WP-name"
  }
}

resource "aws_db_subnet_group" "Private_subnet_group" {
  name       = "main"
  subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id,aws_subnet.private3.id]

  tags = {
    Name = "Private_Subnet_groups"
  }
}