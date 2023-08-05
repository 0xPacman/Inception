FROM debian:11
MAINTAINER Ahmed Jadani <ahmed4star@gmail.com>
RUN apt-get -y update && apt-get install -y pure-ftpd

COPY ./tools/ftpscript.sh /ftpscript.sh
RUN chmod 111 /ftpscript.sh

EXPOSE 2121

CMD ["bin/bash","/ftpscript.sh","&>/dev/null"]
