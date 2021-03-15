# Internet Gateway
resource "aws_internet_gateway" "WP-IGW" {
  vpc_id = aws_vpc.WP-vpc.id
  tags = {
    Name = "WP-igw"
  }
}