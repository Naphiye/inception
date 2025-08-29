FROM debian:bullseye-slim

RUN apt update && apt upgrade -y && \
    apt install -y mariadb-server mariadb-client 

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 3306

ENTRYPOINT ["/init.sh"]
CMD ["mysqld", "--bind-address=0.0.0.0"]