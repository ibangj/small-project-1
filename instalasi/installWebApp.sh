#!/bin/bash
sudo apt update

echo "=============================="
echo "Menginstall Unzip"
echo "============================="

sudo apt-get install zip unzip


jawaban="Y"
read -p "Apakah kamu yakin akan melakukan setup Aplikasi Web Landing Page? (Y/n) " pilih;
if [ $pilih == $jawaban ];
then
echo "=============================>"
echo "Downloading Data"
echo "=============================>"
cd
wget -P /tmp/landing-page/ https://github.com/sdcilsy/landing-page/archive/refs/heads/master.zip
echo "=============================>"
echo "Ekstrak File"
echo "=============================>"
unzip /tmp/landing-page/master.zip -d /tmp/landing-page/
echo "=============================>"
echo "Memindahkan data"
echo "=============================>"
sudo mkdir /var/www/html/landing-page/
sudo mv /tmp/landing-page/landing-page-master/* /var/www/html/landing-page/
echo "Setup Landing Page selesai"
else
echo "Setup Landing Page dibatalkan"
fi

jawaban="Y"
read -p "Apakah kamu yakin akan melakukan setup Aplikasi Web Sosial Media Pesbuk? (Y/n)" pilih;
if [ $pilih == $jawaban ];
then
echo "=============================>"
echo "Downloading Data"
echo "=============================>"
cd
wget -P /tmp/sosial-media/ https://github.com/sdcilsy/sosial-media/archive/refs/heads/master.zip
echo "=============================>"
echo "Ekstrak File"
echo "=============================>"
unzip /tmp/sosial-media/master.zip -d /tmp/sosial-media/
echo "=============================>"
echo "Memindahkan data"
echo "=============================>"
sudo mkdir /var/www/html/sosial-media/
sudo mv /tmp/sosial-media/sosial-media-master/* /var/www/html/sosial-media/
echo "====================================>"
echo "Konfigurasi database dilakukan manual"
echo "====================================>"


echo "Setup Sosial Media Pesbuk selesai"
else
echo "Setup Sosial Media Pesbuk dibatalkan"
fi

jawaban="Y"
read -p "Apakah kamu yakin akan melakukan setup Aplikasi Web Wordpress? (Y/n)" pilih;
if [ $pilih == $jawaban ];
then
echo "=============================>"
echo "Downloading & Installing Data"
echo "=============================>"
sudo apt install wordpress
echo "===================================>"
echo "Membuat situs apache untuk Wordpress"
echo "===================================>"
sudo touch /etc/apache2/sites-available/wordpress.conf
sudo chmod 777 /etc/apache2/sites-available/wordpress.conf
sudo echo 'Alias /blog /usr/share/wordpress
<Directory /usr/share/wordpress>
    Options FollowSymLinks
    AllowOverride Limit Options FileInfo
    DirectoryIndex index.php
    Order allow,deny
    Allow from all
</Directory>
<Directory /usr/share/wordpress/wp-content>
    Options FollowSymLinks
    Order allow,deny
    Allow from all
</Directory>' > /etc/apache2/sites-available/wordpress.conf
sudo chmod 644 /etc/apache2/sites-available/wordpress.conf
echo "===================================>"
echo "Konfigurasi database dilakukan manual"
echo "===================================>"

else
echo "Setup Wordpress dibatalkan"
fi
sudo chmod 777 /var/www/html/index.html
touch /var/www/html/index.html
echo "<!DOCTYPE html>
<html>
<head>
<title>Small Project I</title>
</head>

<body>
<p align="center">
Konten Small Project I
<ol>
<li> <a href="http://172.28.128.3/landing-page/">LANDING PAGE WEBSITE</a>
<li> <a href="http://172.28.128.3/sosial-media/">SOSIAL MEDIA PESBUK</a>
<li> <a href="http://172.28.128.3/blog/">WORDPRESS</a>
</ol>
</body>

</html>"> /var/www/html/index.html
sudo chmod 644 /var/www/html/index.html

echo "====================================================="
echo "             INSTALASI APLIKASI SELESAI              "
echo " SILAHKAN LAKUKAN PENGATURAN DATABASE UNTUK APLIKASI "
echo "====================================================="
