FROM debian:11
MAINTAINER Ahmed Jadani <ahmed4star@gmail.com>
RUN apt-get update -y && apt-get install redis -y
RUN chown -R www-data:www-data /var/lib/redis
RUN sed -i s'/bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf
RUN sed -i s'/# maxmemory <bytes>/maxmemory 200mb/g' /etc/redis/redis.conf
RUN sed -i s'/# maxmemory-policy noeviction/maxmemory-policy allkeys-lru/g' /etc/redis/redis.conf
CMD [ "redis-server", "--protected-mode", "no"]