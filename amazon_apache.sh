#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start
sudo chkconfig httpd on
cd /var/www/html
sudo su
echo "This is the Main Website" > index.html
sudo timedatectl set-timezone Africa/Johannesburg