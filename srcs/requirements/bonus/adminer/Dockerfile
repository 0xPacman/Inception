FROM debian:11
MAINTAINER Ahmed Jadani <ahmed4star@gmail.com>
RUN apt-get update -y && apt-get install php7.4 curl php-mysql -y

COPY ./tools/adminer.sh /adminer.sh
RUN chmod 111 /adminer.sh

CMD ["/bin/bash", "/adminer.sh"]