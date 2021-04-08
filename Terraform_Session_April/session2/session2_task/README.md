<h1><b>Session 2 Task</b></h1>
<b> 1) Create an EC2 instance with the following configurations: </b>

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

<br><b> 2.Onceyoucreateyourinstance,dothefollowing </br></b>
<br>a) Create a public repository in your Github account and name or "Terraform-sessioor </br> 
<br>b) Clone the repository and create the folders called Session-1 Session-2</br> 
<br>c) Inside Session-1 directory, write the summeries and provide examples  </br> <br>orscenarios for the following topics: </br>
i. What is Infrastructure as Code?
ii. What is the difference between immutable infra vs mutable infra?
iii. What is the difference between imperative and declarative approach?
iv. What is the idempotence?
