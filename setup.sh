#!/bin/bash
printf "\033c"
echo "--------------------------------------"
echo "Welcome to the Medieval installation!"
echo "Installation will commence in 5 seconds."
echo "Ctrl+C to exit."
echo "--------------------------------------"
sleep 5

printf "\033c"
echo "Installing Java..."
sleep 2.5

sudo apt update && sudo apt install default-jre

printf "\033c"
echo "Installing SQL..."
sleep 2.5

sudo apt-get update && sudo apt-get upgrade

# Get and install sql's repository:
sudo wget https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.10-1_all.deb
sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 8C718D3B5072E1F5

apt install mysql-server mysql-client

printf "\033c"
echo "Installing pip & pymysql..."
sudo apt install python-pip
sudo pip install pymysql
sudo apt-get install python-mysqldb

printf "\033c"
while true; do
    read -p "Run mysql secure installation? [Y/n] " yn
    case $yn in
        [Yy]* ) mysql_secure_installation; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

printf "\033c"
echo "Installing Apache..."
sleep 2.5

sudo sudo apt update && sudo apt install apache2
sudo ufw allow 'Apache'

while true; do
    read -p "Install phpmyadmin? (Recommended) [Y/n] " yn
    case $yn in
        [Yy]* ) sudo apt update && sudo apt install phpmyadmin php-mbstring php-gettext && sudo phpenmod mbstring && sudo systemctl restart apache2; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

ln -s /usr/share/phpmyadmin/ /var/www/html/phpmyadmin

php -f database.php

echo "--------------------------------------"
echo "Congrats! The database is all set-up!"
echo "Now get and compile: "
echo "> https://github.com/ElMedievo/Medievo"
echo "> https://github.com/ElMedievo/Medievo-Utils"
echo "Hopefully this will be automated soon."
echo "Good Bye!"
echo "--------------------------------------"
