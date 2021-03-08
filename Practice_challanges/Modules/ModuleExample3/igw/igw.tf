# Create Internet Gateway
resource "aws_internet_gateway" "terraform_project1_Internet_Gateway" {
  vpc_id = aws_vpc.terraform_project1_vpc.id

  tags = {
    Name = "Terraform_project1_IG"
  }
}