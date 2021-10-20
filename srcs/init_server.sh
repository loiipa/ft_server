#!bin/bash

# install phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
mv phpmyadmin /var/www/html/
rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz

# install wordpress
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/ var/www/html/
rm -rf latest.tar.gz

# change wordpress owner
chown -R www-data:www-data /var/www/html/wordpress

# copy settings
# cp /cjang_srcs/default /etc/nginx/sites-available/
cp /cjang_srcs/phpinfo.php /var/www/html/
cp /cjang_srcs/wp-config.php /var/www/html/wordpress
cp /cjang_srcs/config.inc.php /var/www/html/phpmyadmin/

# add mysql user, database
service mysql start
mysql -e "CREATE USER 'cjang'@'%' identified by '888';"
mysql -e "CREATE DATABASE wordpress;"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'cjang'@'%' identified by '888';"

# add private key, public key, csr, crt
openssl genrsa -out /etc/ssl/private/cjang_private.key
openssl rsa -in /etc/ssl/private/cjang_private.key -pubout -out /etc/ssl/private/cjang_public.key
openssl req -subj "/C=KR/ST=Seoul/L=GangNam/O=42SEOUL/CN=cjang" -new -key /etc/ssl/private/cjang_private.key -out /etc/ssl/private/cjang_csr.csr
openssl x509 -req -days 365 -signkey /etc/ssl/private/cjang_private.key -in /etc/ssl/private/cjang_csr.csr -out /etc/ssl/certs/cjang_crt.crt
chmod 600 /etc/ssl/private/cjang_private.key
