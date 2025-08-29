FROM debian:bullseye-slim

RUN apt update && apt upgrade -y && \
    apt install -y wget  \
    php7.4  \
    php-fpm  \
    php-mysql  \
    mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && \
    tar -xzf wordpress-6.0-fr_FR.tar.gz && \
    rm wordpress-6.0-fr_FR.tar.gz && \
    chown -R root:root /var/www/wordpress

RUN grep -v '^listen = ' /etc/php/7.4/fpm/pool.d/www.conf > /tmp/www.conf && \
    echo 'listen = wordpress:9000' >> /tmp/www.conf && \
    echo 'clear_env = no' >> /tmp/www.conf && \
    mv /tmp/www.conf /etc/php/7.4/fpm/pool.d/www.conf
    
COPY ./conf/auto_config.sh /auto_config.sh

RUN chmod +x /auto_config.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["/auto_config.sh"]