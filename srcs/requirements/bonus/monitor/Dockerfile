FROM debian:11
MAINTAINER Ahmed Jadani <ahmed4star@gmail.com>
RUN apt-get update -y && apt-get install wget curl netcat -y

COPY ./tools/script.sh /script.sh
RUN chmod 111 /script.sh

CMD ["bin/bash","/script.sh"]