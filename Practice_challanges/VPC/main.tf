
# Create a VPC
resource "aws_vpc" "TB-VPC" {
  cidr_block = "192.168.0.0/24"
  tags = {
    "Name" = "terraform_practice"
  }
}