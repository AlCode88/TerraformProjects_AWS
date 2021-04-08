<h1><b>Session 2 Task</b></h1>
<b> Create an EC2 instance with the following configurations: <b>
a) Region: us-west-2
b) AMI: Centos7
c) Security Group: default
d) VPC: default
e) Subnet: us-west-2b
d) Tag: Name: Web-Instance
g) Userdata:
   #!/bin/bash
   sudo yum install httpd -y
   sudo systemctl enable httpd
   sudo systemctl restart httpd -y
   sudo echo "Hello from Web Instance" > /var/www/html/index.html
   sudo chown -R apache:apache /vat/www/html