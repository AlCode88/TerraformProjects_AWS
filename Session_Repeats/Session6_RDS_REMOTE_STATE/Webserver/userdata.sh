#!/bin/bash
sudo su
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "db details for dev env\naddress = ${address}\nusername=${username}"  >> /var/www/html/index.html