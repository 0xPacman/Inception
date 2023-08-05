# !/bin/bash
if [ ! -d /var/lib/mysql/${DB_NAME} ]; then
	sed -i 's/^#.*port\s*=\s*3306/port = 3306/' /etc/mysql/mariadb.conf.d/50-server.cnf
	sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
	service mysql start
	sleep 1
	mysql -e "CREATE DATABASE $DB_NAME;"
	mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$PASSWORD';"
	mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
	mysql -e "FLUSH PRIVILEGES;"
	sleep 1
	mysql -u$DB_ROOT -p$PASSWORD -e "CREATE USER '$DB_ROOT'@'%' IDENTIFIED BY '$PASSWORD';"
	mysqladmin -u$DB_ROOT -p$PASSWORD shutdown

fi

mysqld_safe