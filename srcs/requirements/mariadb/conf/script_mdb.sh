#!/bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

chown -R mysql:mysql /var/lib/mysql
mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

TMP=/tmpfile

echo "USE mysql;" > ${TMP}
echo "FLUSH PRIVILEGES;" >> ${TMP}
echo "DELETE FROM mysql.user WHERE User='';" >> ${TMP}
echo "DROP DATABASE IF EXISTS test;" >> ${TMP}
echo "DELETE FROM mysql.db WHERE Db='test';" >> ${TMP}
echo "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" >> ${TMP}
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';" >> ${TMP}
echo "CREATE DATABASE ${WP_DB_NAME};" >> ${TMP}
echo "CREATE USER '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';" >> ${TMP}
echo "GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';" >> ${TMP}
echo "FLUSH PRIVILEGES;" >> ${TMP}

/usr/bin/mysqld --user=mysql --bootstrap < ${TMP}
rm -f ${TMP}

sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=mariadb|g" /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld --user=mysql --console
