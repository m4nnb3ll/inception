FROM debian:bullseye

ARG MDB_DB
ARG MDB_USER
ARG MDB_PWD
ARG MDB_ROOT_PWD

RUN apt update -y && \
    apt upgrade -y && \
    apt install mariadb-server -y && \
    rm -rf /var/lib/apt/lists/*

COPY conf/mdb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Create database, new user and change root password
RUN service mariadb start && \
    mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $MDB_DB; \
    CREATE USER IF NOT EXISTS $MDB_USER @'localhost' IDENTIFIED BY '$MDB_PWD'; \
    GRANT ALL PRIVILEGES ON $MDB_DB.* TO $MDB_USER@'%' IDENTIFIED BY '$MDB_PWD'; \
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$MDB_ROOT_PWD'; \
    FLUSH PRIVILEGES;" &&  \
    mysqladmin -u root -p$MDB_ROOT_PWD shutdown

CMD ["mysqld_safe"]

EXPOSE 3306
