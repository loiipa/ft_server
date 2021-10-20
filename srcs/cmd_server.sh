# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    cmd_server.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cjang <cjang@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/02 17:44:15 by cjang             #+#    #+#              #
#    Updated: 2021/04/02 17:44:38 by cjang            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

service nginx start
service php7.3-fpm start
service php7.3-fpm status
service mysql start

bash
