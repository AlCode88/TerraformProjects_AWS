#Terraform project
# 1 Create a VPC.
resource "aws_vpc" "terraform_project1_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-terraform_project1_vpc"
  }
}
# 2 Create Internet Gateway
resource "aws_internet_gateway" "terraform_project1_Internet_Gateway" {
  vpc_id = aws_vpc.terraform_project1_vpc.id

  tags = {
    Name = "Terraform_project1_IG"
  }
}
# 3 Create Custom Route Table
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
# 4 Create a Subnet
resource "aws_subnet" "terraform_project1_subnet" {
  vpc_id            = aws_vpc.terraform_project1_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "terraform_project1_subnet"
  }
}
# 5 Associate Subnet with Route Table
resource "aws_route_table_association" "subnet_associate" {
  subnet_id      = aws_subnet.terraform_project1_subnet.id
  route_table_id = aws_route_table.terraform_project1_Route_Table.id
}
# 6 Create Security Group to allow port 22, 80, 443 
resource "aws_security_group" "terraform_project1_SG" {
  name        = "Terraform_Project_1_SG"
  description = "This is SG for the Terrafomr Project1"
  vpc_id      = aws_vpc.terraform_project1_vpc.id

  ingress {
    description = "https from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "https from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web_terraform"
  }
}
#  7 Create a Subnet with a Network Interface with an  IP in the subnet  that was created in Step 4 
resource "aws_network_interface" "terraform_network_interface" {
  subnet_id       = aws_subnet.terraform_project1_subnet.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.terraform_project1_SG.id]
}
# 8  Assign An Elastic IP to the Network Interface Created in step 7 
resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.terraform_network_interface.id
  associate_with_private_ip = "10.0.1.50"
  depends_on                = [aws_internet_gateway.terraform_project1_Internet_Gateway]
}
# 9 Create an Centos Server and Install/enable apache
resource "aws_instance" "terraform_apache_instance" {
  ami               = "ami-047a51fa27710816e"
  instance_type     = "t2.medium"
  availability_zone = "us-east-1a"


  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.terraform_network_interface.id
  }
  user_data = <<EOF
  #!/bin/bash
  sudo yum install httpd -y
  sudo systemctl start httpd -y
  sudo systemctl enable httpd -y
  sudo echo "Hello World from Terraform project" > /var/www/html/index.html
  EOF
  tags = {
    "Name" = "terraform_project_instance"
  }
}
