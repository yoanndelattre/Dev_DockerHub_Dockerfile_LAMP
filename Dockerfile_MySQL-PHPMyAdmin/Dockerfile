FROM yoanndelattre/base:base-debian_jessie
MAINTAINER Yoann Delattre "github.com/yoanndelattre | twitter.com/yoanndelattre_"
RUN apt-get update && apt-get upgrade -y
ENV DEBIAN_FRONTEND=noninteractive

#     <--install mysql-->
RUN echo 'mysql-server mysql-server/root_password password passwd_sql' | debconf-set-selections
RUN echo 'mysql-server mysql-server/root_password_again password passwd_sql' | debconf-set-selections
RUN apt-get -y install mysql-server --no-install-recommends
RUN sed -ie "s/^bind-address\s*=\s*127\.0\.0\.1$/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

#     <--install phpmyadmin-->
RUN echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
RUN echo 'phpmyadmin phpmyadmin/app-password-confirm password phpmyadmin_password ' | debconf-set-selections
RUN echo 'phpmyadmin phpmyadmin/mysql/admin-pass password passwd_sql' | debconf-set-selections
RUN echo 'phpmyadmin phpmyadmin/mysql/app-pass password passwd_sql' | debconf-set-selections
RUN echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
RUN /etc/init.d/mysql start; apt-get -y install phpmyadmin --no-install-recommends

#     <--add default file-->
RUN rm /var/www/html/*
ADD Contents/index.html /var/www/html/

#     <--clean installation-->
RUN apt-get -qy clean && \
      rm -rf /var/lib/apt/lists/*

VOLUME ["/mnt", "/var/log/mysql/"]
EXPOSE 80 3306
WORKDIR  /mnt
CMD service apache2 start; mysqld_safe
