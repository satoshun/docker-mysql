#!/bin/sh

mysqld_safe --skip-grant-tables &
pid=$!

mysql_install_db --user=mysql --datadir=/var/lib/mysql
mysql -uroot GRANT ALL PRIVILEGES ON *.* TO mysql@localhost
mysql -uroot GRANT ALL PRIVILEGES ON *.* TO mysql@"%"
kill -KILL $pid

mysqld_safe
