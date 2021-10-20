#!bin/bash
input="1"
until [ $input = "y" -o $input = "Y" -o $input = "n" -o $input = "N" ]
do
	echo "autoindex ON? [y/n]"
	read -n 1 -s input
done

if [ $input = "y" -o $input = "Y"]
then
	echo $input
	cp /cjang_srcs/default_on /etc/nginx/sites-available/default
else
	echo $input
	cp /cjang_srcs/default_off /etc/nginx/sites-available/default
fi

service nginx start
service php7.3-fpm start
service php7.3-fpm status
service mysql start

bash
