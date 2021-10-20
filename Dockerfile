# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cjang <cjang@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/29 18:59:33 by cjang             #+#    #+#              #
#    Updated: 2021/10/20 15:52:00 by cjang            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# install debian
FROM	debian:buster

# my info
LABEL	maintainer="cjang@student.42seoul.kr"
LABEL	title="ft_server"
LABEL	version="1.1"

# install applications
RUN		apt-get -y update
RUN		apt-get -y install nginx
RUN		apt-get -y install php7.3-fpm
RUN		apt-get -y install php-mysql
RUN		apt-get -y install mariadb-server
RUN		apt-get -y install openssl
RUN		apt-get -y install wget

# copy settings
COPY	srcs/default_off /cjang_srcs/
COPY	srcs/default_on /cjang_srcs/
COPY	srcs/phpinfo.php /cjang_srcs/
COPY	srcs/wp-config.php /cjang_srcs/
COPY	srcs/config.inc.php /cjang_srcs/
COPY	srcs/init_server.sh ./
COPY	srcs/cmd_server.sh ./

# port number
EXPOSE	80
EXPOSE	443

# install phpmyadmin, wordpress / copy settings / add mysql id, db / add ssl
RUN		bash init_server.sh

# execute bash
CMD		bash cmd_server.sh
