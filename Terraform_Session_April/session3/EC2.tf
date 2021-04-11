resource "aws_instance" "session3_EC2" {
  ami                     = "ami-0742b4e673072066f"
  instance_type           = "t2.micro"
  vpc_security_group_ids = [aws_security_group.session3_SG.id]
  key_name                = "My_Mac_keys"
  user_data               = file("userdata.sh")

  tags = {
    Name = var.env
  }
}