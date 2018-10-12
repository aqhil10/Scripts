#!/bin/sh

#######################################
### Bash script to install an AMP stack and PHPMyAdmin plus tweaks. For CentOS 7.
### Written by Akhil Uthaman
#######################################

# In case of any errors (e.g. MySQL) just re-run the script. Nothing will be re-installed except for the packages with errors.

Color_Off='\033[0m'       # Text Reset
Yellow='\033[0;33m'       # Yellow


# Updating packages and Upgrade system

echo -e "$Yellow \n Updating System Packages $Color_Off"
yum update -y
echo -e "$Yellow \n System Packages Have Been Updated $Color_Off"

echo -e "$Yellow \n Installing And Settings Up  Apache $Color_Off"
yum install httpd -y
systemctl start httpd.service
systemctl enable httpd.service
echo -e "$Yellow \n Apache Installed $Color_Off"

echo -e "$Yellow \n Installing And Setting Up MySQL $Color_Off"
yum install mariadb-server mariadb -y
systemctl start mariadb
systemctl enable mariadb.service
echo -e "$Yellow \n MySQL Installed $Color_Off"


echo -e "$Yellow \n Installing PHP $Color_Off"
yum install php php-common php-mysql php-gd php-xml php-mbstring php-mcrypt -y
echo -e "$Yellow \n PHP Installed $Color_Off"

echo -e "$Yellow \n Restarting Apache and MySQL after installing PHP $Color_Off"
systemctl restart httpd.service
systemctl restart mariadb
echo -e "$Yellow \n Apache and MySQL started $Color_Off"

touch /var/www/html/index.php
echo Hello World  /var/www/html/index.php
chown -R apache:apache /var/www/html/

echo  Please secure MySQL mysql_secure_installation
echo Please search and install any required PHP modules yum search php-
