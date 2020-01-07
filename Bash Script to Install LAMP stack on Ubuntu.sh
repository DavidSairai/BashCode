#!/bin/bash

# Update Package Index
sudo apt update

# Install Apache2, MySQL, PHP
sudo apt install apache2 mysql-server php php-mysql libapache2-mod-php php-cli

# Allow to run Apache on boot up
sudo systemctl enable apache2

# Restart Apache Web Server
sudo systemctl start apache2

# Adjust Firewall
sudo ufw allow in "Apache Full"

# Allow Read/Write for Owner
sudo chmod -R 0755 /var/www/html/

# Create info.php for testing php processing
sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php

#Allow AWS Ubuntu instance to upgrade pHp
sudo chown -Rf www-data.www-data /var/www/html/

# Open localhost in the default browser
xdg-open "http://localhost"
xdg-open "http://localhost/info.php"

# Set Time Zone to Africa Johannesburg
sudo timedatectl set-timezone Africa/Johannesburg

sudo apt update -y
sudo apt install apache2 mysql-server php php-mysql libapache2-mod-php php-cli -y
sudo systemctl enable apache2
sudo systemctl start apache2
sudo ufw allow in "Apache Full"
sudo chmod -R 0755 /var/www/html/
sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php
sudo chown -Rf www-data.www-data /var/www/html/
sudo timedatectl set-timezone Africa/Johannesburg