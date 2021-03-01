#Terraform project
This is a random practice project. 

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

## User_Data
!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd -y
sudo systemctl enable httpd -y
sudo echo "Hello World from Terraform project" > /var/www/html/index.html

 
