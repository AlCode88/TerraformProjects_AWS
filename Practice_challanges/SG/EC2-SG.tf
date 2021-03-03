resource "aws_instance" "terraformEC2" {
 instance_type = "t2.micro"
 ami = "ami-0915bcb5fa77e4892"
 security_groups = [aws_security_group.terraformSG.name ]
 tags = {
   "Name" = "TerraformPractice"
 }
}
# This will be our Security Group for the EC2
resource "aws_security_group" "terraformSG" {
  
  name        = "terraformEC2"
  description = "allow the trafic from 22"
  

  ingress {
    description = "Allow port for 22"
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
    Name = "terraformEC2"
  }
}
