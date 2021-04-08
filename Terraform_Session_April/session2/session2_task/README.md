<h1><b>Session 2 Task</b></h1>
<b> Create an EC2 instance with the following configurations: </b>

<br> a) Region: us-west-2 </br>
<br> b) AMI: Centos7 </br>
<br> c) Security Group: default </br>
<br> d) VPC: default </br>
<br> e) Subnet: us-west-2b </br>
<br> d) Tag: Name: Web-Instance </br>
<br> g) Userdata: </br>
<br>    #!/bin/bash </br>
<br>    sudo yum install httpd -y </br>
<br>    sudo systemctl enable httpd </br>
<br>    sudo systemctl restart httpd -y </br>
<br>    sudo echo "Hello from Web Instance" > /var/www/html/index.html </br>
<br>    sudo chown -R apache:apache /vat/www/html </br>