# 1 Create a VPC.
resource "aws_vpc" "terraform_project1_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-terraform_project1_vpc"
  }
}