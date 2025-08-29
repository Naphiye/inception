#!/bin/bash

sleep 10  # attendre MariaDB

mkdir -p /run/php

source /run/secrets/credentials.txt
SQL_PASSWORD=$(cat /run/secrets/db_password.txt)


if [ ! -f /var/www/wordpress/wp-config.php ]; then
    echo "Configuration automatique de WordPress..."

    wp config create --allow-root \
        --dbname="$SQL_DATABASE" \
        --dbuser="$SQL_USER" \
        --dbpass="$SQL_PASSWORD" \
        --dbhost="mariadb:3306" \
        --path="/var/www/wordpress"

    wp core install --allow-root \
        --url="http://localhost" \
        --title="MON SITE TROP GENIAL" \
        --admin_user="$WP_ADMIN" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --path="/var/www/wordpress"

    wp user create "$WP_USER" "$WP_USER_EMAIL" \
        --user_pass="$WP_USER_PASSWORD" \
        --role=author \
        --allow-root \
        --path="/var/www/wordpress"
else
    echo "WordPress déjà configuré."
fi

exec php-fpm7.4 -F
