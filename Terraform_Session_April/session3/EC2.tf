resource "aws_instance" "session3_EC2" {
  ami           = "ami-0742b4e673072066f"
  instance_type = "t2.micro"
  user_data = <<EOF
  #!/bin/bash
  sudo yum install httpd -y
  sudo echo "Hello from EC2" >> /var/www/html/index.html
  sudo systemctl start httpd
  EOF

  tags = {
    Name = "Instance-1"
  }
}