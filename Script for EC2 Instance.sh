sudo yum update -y

sudo yum install httpd php php-mysql stress -y

cd /etc/httpd/conf

sudo cp httpd.conf htttpdconfbackup.conf

sudo rm -rf httpd.conf

wget https://s3-eu-west-1.amazonaws.com/acloudguru-wp/httpd.conf

cd /var/www/html

echo "healthy" > healthy.html

sudo wget https://wordpress.org/latest.tar.gz

sudo tar -xzf latest.tar.gz

sudo cp -r wordpress/* /var/www/html/

sudo rm -rf wordpress

sudo rm -rf latest.tar.gz

sudo chmod -R 755 wp-content

sudo chown -R apache:apache wp-content

sudo service httpd start

sudo chkconfig httpd on