EC2 Project

Resources needed
2-EC2s
1-Dynamic SG 
1-EIP 

1) Create a DB server instance and ouput the private IP

2) Create a webserver instance and ensure it has a fixed public IP(Elastic IP)

3) Create a Security Group for the WebServer with the opening ports 80 and 443 (HTTP and HTTPS) - creae a Dynamic Security Group

4) Use "user data file" to provide the apache.sh file. The file should have a relative path to the terraform file. 