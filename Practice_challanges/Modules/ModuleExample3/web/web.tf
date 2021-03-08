# 9 Create an Centos Server and Install/enable apache
resource "aws_instance" "terraform_apache_instance" {
  ami               = "ami-047a51fa27710816e"
  instance_type     = "t2.medium"
  availability_zone = "us-east-1a"
  user_data = "file(userdata.sh)"
network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.terraform_network_interface.id
  }
  tags = {
    "Name" = "terraform_project_instance"
  }
}

