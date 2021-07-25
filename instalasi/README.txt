Panduan Konfigurasi Database - Sosial Media
===========================================

Sudo mysql -u root -p
<masuk ke dalam mysql>
create user 'devopscilsyâ'@'localhost' identified by '1234567890';
grant all privileges on *.* to 'devopscilsy'@'localhost';
\q
<keluar dari mysql>

sudo mysql -u devopscilsy -p
<masuk ke dalam mysql>
create database dbsosmed
\q
<keluar dari mysql>

cd /var/www/html
sudo mysql -u devopscilsy -p dbsosmed < dump.sql

Panduan Konfigurasi Database - Wordpress
=======================================

$ sudo mysql -u root
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 7
Server version: 5.7.20-0ubuntu0.16.04.1 (Ubuntu)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE wordpress;
Query OK, 1 row affected (0,00 sec)

mysql> GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER
    -> ON wordpress.*
    -> TO wordpress@localhost
    -> IDENTIFIED BY '<your-password>';
Query OK, 1 row affected (0,00 sec)

mysql> FLUSH PRIVILEGES;
Query OK, 1 row affected (0,00 sec)

mysql> quit
Bye

<keluar dari mysql>

sudo nano /etc/wordpress/config-localhost.php

<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'wordpress');
define('DB_PASSWORD', '<your-password>');
define('DB_HOST', 'localhost');
define('DB_COLLATE', 'utf8_general_ci');
define('WP_CONTENT_DIR', '/usr/share/wordpress/wp-content');
?>

