FROM yoanndelattre/base:base-ubuntu
LABEL MAINTAINER='Yoann Delattre "github.com/yoanndelattre | twitter.com/yoanndelattre_"'
ENV MYSQL_DATA_DIR=/var/lib/mysql \
    MYSQL_RUN_DIR=/run/mysqld \
    MYSQL_LOG_DIR=/var/log/mysql \
    DB_NAME=db \
    DB_USER=root \
    DB_PASS=passwd
RUN apt-get update && apt-get upgrade -y && \
      DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && \
      rm -rf ${MYSQL_DATA_DIR}
COPY Contents/entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh && \
      apt-get -qy clean && \
      rm -rf /var/lib/apt/lists/*
VOLUME ["/var/log/mysql/", "/etc/mysql", "/var/lib/mysql"]
EXPOSE 3306
ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["/usr/bin/mysqld_safe"]
