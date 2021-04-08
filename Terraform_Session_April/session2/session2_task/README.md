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
<br>a) Create a public repository in your Github account and name or "Terraform-session </br> 
<br>b) Clone the repository and create the folders called Session-1 Session-2</br> 
<br>c) Inside Session-1 directory, write the summeries and provide examples  </br> <br>orscenarios for the following topics: </br>
<br>i. What is Infrastructure as Code?</br>
<br>ii. What is the difference between immutable infra vs mutable infra?</br>
<br>iii. What is the difference between imperative and declarative approach?</br>
<br>iv. What is the idempotence?</br>
<br>d) Move all the Terraform configuration files that are creating an EC2 instance ot Session-2 directory. </br>
<br>e) Push everything to GitHub and send your Repository URL to slack channel</br>
