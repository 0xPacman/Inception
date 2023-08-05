FROM debian:11
MAINTAINER Ahmed Jadani <ahmed4star@gmail.com>


RUN apt-get -y update && apt-get install -y nodejs npm
RUN mkdir -p /web
COPY ./web/ /web/
WORKDIR /web
RUN npm install

CMD ["node","server.js"]