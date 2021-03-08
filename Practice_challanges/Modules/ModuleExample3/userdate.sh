  #!/bin/bash
  sudo yum install httpd -y
  sudo systemctl start httpd -y
  sudo systemctl enable httpd -y
  sudo echo "Hello World from Terraform project" > /var/www/html/index.html
  
