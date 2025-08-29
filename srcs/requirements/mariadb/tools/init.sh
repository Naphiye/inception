#!/bin/bash
set -e

mkdir -p /run/mysqld && \
chown -R mysql:mysql /run/mysqld

SQL_PASSWORD=$(cat /run/secrets/db_password.txt)
SQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password.txt)

if [ ! -f "/var/lib/mysql/.db_initialized" ]; then
    echo "Init DB..."
        # Initialise la base de données (vide)
    mysqld --skip-networking &
    sleep 5

    mysql -uroot <<-EOSQL
        CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
        CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';
        GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';
        ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
        FLUSH PRIVILEGES;
EOSQL
    touch /var/lib/mysql/.db_initialized

    mysqladmin -uroot -p${SQL_ROOT_PASSWORD} shutdown
else
  echo "DB déjà initialisée, init ignorée"
fi
echo "✅ INIT SCRIPT TERMINÉ"


exec "$@";
