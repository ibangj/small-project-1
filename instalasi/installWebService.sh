#!/bin/bash

jawaban="Y"
read -p "Apakah kamu yakin akan menginstall web server & database server ? (Y/n) " pilih;
if [ $pilih == $jawaban ];
then

echo "--------------------------------"
echo "Menyiapkan Installasi Web server"
echo "--------------------------------"
sudo apt-get update
echo "Melakukan Installasi Webserver"
sudo apt-get install apache2 php5 php5-mysql libapache2-mod-php5 php5-mcrypt
echo "Melakukan Installasi Database Server"
sudo apt-get install mysql-server
echo "Instalasi Selesai"
exit 0
else
echo "Instalasi dibatalkan"
exit 1
fi

