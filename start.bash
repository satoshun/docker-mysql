#!/bin/sh

mysqld_safe --skip-grant-tables &
pid=$!
mysql_install_db --datadir=/var/lib/mysql
mysqladmin --silent --wait=30 ping || exit 1
mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'
mysql -e -uroot 'CREATE DATABASE blog'
kill $pid

mysqld_safe
