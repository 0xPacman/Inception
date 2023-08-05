FROM debian:11
MAINTAINER Ahmed Jadani <ahmed4star@gmail.com>
RUN apt-get update -y && apt-get install curl wget php7.4-fpm php-mysql mariadb-client -y
WORKDIR /var/www/html/wordpress
# RUN chown -R www-data:www-data /var/www/html/wordpress
RUN sed -i 's/listen =.*/listen = 9000/g' /etc/php/*/fpm/pool.d/www.conf
COPY ./tools/wpscript.sh /wpscript.sh
RUN chmod 111 /wpscript.sh
ENTRYPOINT [ "/bin/bash","/wpscript.sh"]
