FROM yoanndelattre/base:base-ubuntu
LABEL MAINTAINER='Yoann Delattre "github.com/yoanndelattre | twitter.com/yoanndelattre_"'
ENV MYSQL_DATA_DIR=/var/lib/mysql \
    MYSQL_LOG_DIR=/var/log/mysql \
    DB_NAME=db \
    DB_USER=root \
    DB_PASS=passwd
RUN apt-get update && apt-get upgrade -y && \ 
      DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && \ 
      sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf && \ 
      mkdir /var/run/mysqld && \
      chown -R mysql:mysql /var/run/mysqld && \
      rm -rf ${MYSQL_DATA_DIR} && \
      apt-get -qy clean && \
      rm -rf /var/lib/apt/lists/*
VOLUME ["/var/log/mysql/", "/etc/mysql", "/var/lib/mysql"]
EXPOSE 3306
CMD ["mysqld_safe"]
