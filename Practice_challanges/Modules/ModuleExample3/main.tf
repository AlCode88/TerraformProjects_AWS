





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
