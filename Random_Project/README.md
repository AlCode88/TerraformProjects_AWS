# Terraform project

## Resoures created.
1) VPC
2) Internet Gateway
3) Route Table
4) Subnet
5) Associate Subnet with Route Table
6) Security groups - ports ( 22, 80, 443)
7) Network Interface
8) EIP
9) EC2 Apache app server

### User_Data
<br> !/bin/bash
<br> sudo yum install httpd -y
<br> sudo systemctl start httpd -y
<br> sudo systemctl enable httpd -y
<br> sudo echo "Hello World from Terraform project" > /var/www/html/index.html