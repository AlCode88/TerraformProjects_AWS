#!/bin/bash
sudo su
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World from ${env} name $(hostname -f)" > /var/www/html/index.html