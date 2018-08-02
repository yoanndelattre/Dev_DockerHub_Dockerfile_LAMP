FROM yoanndelattre/base:base-debian
MAINTAINER Yoann Delattre "github.com/yoanndelattre | twitter.com/yoanndelattre_"
RUN apt-get update && apt-get upgrade -y
RUN apt-get install git apt-utils automake cron curl dpkg make man-db nano tar unzip vim software-properties-common wget zip -y
RUN git config --global user.email "yoanndelattre21@gmail.com"
RUN git config --global user.name "ImWargame"

#     <--install mysql-->
RUN apt-get install -y mysql-server mysql-client

#     <--clean installation-->
RUN apt-get -qy clean && \
      rm -rf /var/lib/apt/lists/*

VOLUME ["/mnt"]
EXPOSE 80 443 5432 3306
WORKDIR  /mnt
ENTRYPOINT apt-get update && apt-get upgrade -y && service mysql restart && /bin/bash
