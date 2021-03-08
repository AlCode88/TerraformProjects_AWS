



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
