FROM yoanndelattre/base:base-debian
LABEL MAINTAINER='Yoann Delattre "github.com/yoanndelattre | twitter.com/yoanndelattre_"'
RUN apt-get update && apt-get upgrade -y && \
      apt-get install -y apache2 php libapache2-mod-php && \
      /usr/sbin/a2ensite default-ssl && \
      /usr/sbin/a2enmod ssl && \
      rm -rf /var/www/html/* && \
      apt-get -qy clean && \
      rm -rf /var/lib/apt/lists/*
COPY Contents/index.php /var/www/html/
VOLUME ["/var/www/html"]
EXPOSE 80 443
WORKDIR /var/www/html
CMD apachectl -D FOREGROUND