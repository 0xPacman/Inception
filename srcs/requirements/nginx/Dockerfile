FROM debian:11
MAINTAINER Ahmed Jadani <ahmed4star@gmail.com>
RUN apt-get update -y && apt-get install nginx openssl -y
COPY ./tools/sslscript.sh /sslscript.sh
RUN chmod 111 /sslscript.sh && cd / && ./sslscript.sh 
COPY ./default /etc/nginx/sites-available/default
CMD [ "nginx","-g","daemon off;" ]