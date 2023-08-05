FROM debian:10
MAINTAINER Ahmed Jadani <ahmed4star@gmail.com>
RUN apt-get update -y && apt-get install mariadb-server -y
COPY ./tools/confscript.sh /confscript.sh
RUN chmod 111 /confscript.sh
ENTRYPOINT [ "/bin/bash","./confscript.sh"]