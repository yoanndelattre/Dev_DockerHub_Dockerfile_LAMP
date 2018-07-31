FROM debian
MAINTAINER Yoann Delattre "github.com/yoanndelattre | twitter.com/yoanndelattre_"
RUN apt-get update && apt-get upgrade -y
RUN apt-get install git apt-utils automake cron curl dpkg make man-db nano tar unzip vim software-properties-common wget zip -y
RUN git config --global user.email "yoanndelattre21@gmail.com"
RUN git config --global user.name "ImWargame"
RUN apt-get install -y apache2
RUN /usr/sbin/a2ensite default-ssl
RUN /usr/sbin/a2enmod ssl
RUN apt-get install -y php libapache2-mod-php php-cli php-mysql mysql-client mysql-server
RUN apt-get clean
RUN rm /var/www/html/*
ADD Contents/index.php /var/www/html/
VOLUME ["/mnt", "/var/www/html"]
EXPOSE 80 443
WORKDIR  /mnt
ENTRYPOINT apt-get update && apt-get upgrade -y && service apache2 restart && service mysql restart && /bin/bash