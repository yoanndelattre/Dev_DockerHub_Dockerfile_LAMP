FROM yoanndelattre/base:base-debian
MAINTAINER Yoann Delattre "github.com/yoanndelattre | twitter.com/yoanndelattre_"
RUN apt-get update && apt-get upgrade -y

#     <--install apache2 and enable ssl-->
RUN apt-get install -y apache2
RUN /usr/sbin/a2ensite default-ssl
RUN /usr/sbin/a2enmod ssl

#     <--install php-->
RUN apt-get install -y php libapache2-mod-php php-cli php-mysql php-dev

#     <--clean installation-->
RUN apt-get -qy clean && \
      rm -rf /var/lib/apt/lists/*

#     <--add default file-->
RUN rm /var/www/html/*
ADD Contents/index.php /var/www/html/

VOLUME ["/mnt", "/var/www/html"]
EXPOSE 80 443
WORKDIR  /var/www/html
ENTRYPOINT apt-get update && apt-get upgrade -y && service apache2 start && /bin/bash
