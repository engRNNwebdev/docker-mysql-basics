#!/usr/bin/env bash

echo "Let us begin"

set -m
set -e

MYSQL_DB=${MYSQL_DB:-vision}
MYSQL_USER=${MYSQL_USER:-groot}
MYSQL_PASS=${MYSQL_PASSWORD:-imagroot}

mysqld_safe &

sleep 10

cat /image-dumps/*.sql | mysql
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB}"
mysql -u root -e "GRANT SHOW DATABASES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}' "
mysql -u root -e "GRANT ALL ON *.* to '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}'"
mysql -u root -e "FLUSH PRIVILEGES"

fg
