#!/bin/sh

if [ ! -d "/var/lib/mysql/performance_schema" ]; then
    mysql_install_db --datadir=/var/lib/mysql
fi

mysqld_safe &
sleep 3

mysqladmin --silent --wait=30 ping || exit 1
mysql -e 'GRANT ALL PRIVILEGES ON *.* TO "root"@"%" WITH GRANT OPTION;'
# mysql -uroot -e 'CREATE DATABASE if not exists blog CHARACTER SET utf8 COLLATE utf8_general_ci;'
