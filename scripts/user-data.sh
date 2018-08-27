#! /bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "Hello Cloud Gurus" > /var/www/html/index.html