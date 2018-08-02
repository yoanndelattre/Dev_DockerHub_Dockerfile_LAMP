FROM yoanndelattre/base:base-debian
MAINTAINER Yoann Delattre "github.com/yoanndelattre | twitter.com/yoanndelattre_"
RUN apt-get update && apt-get upgrade -y
ENV DEBIAN_FRONTEND=noninteractive

#     <--install mysql-->
RUN apt-get install -y mysql-server mysql-client phpmyadmin

#     <--clean installation-->
RUN apt-get -qy clean && \
      rm -rf /var/lib/apt/lists/*

VOLUME ["/mnt"]
EXPOSE 80 443 5432 3306
WORKDIR  /mnt
ENTRYPOINT apt-get update && apt-get upgrade -y && service mysql restart && /bin/bash
