#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php81/php-fpm.d/www.conf

./wp-cli.phar cli update --yes --allow-root
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=${WP_DB_NAME} --dbuser=${WP_DB_USER} --dbpass=${WP_DB_PASSWORD} --dbhost=${DB_HOST}:3306 --path=${WP_PATH} --allow-root
./wp-cli.phar core install --url=${DOMAIN}/wordpress --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${EMAIL3} --path=${WP_PATH} --allow-root
./wp-cli.phar user create $WP_USER ${EMAIL1} --user_pass=${WP_USER_PASSWORD} --role=subscriber --display_name=${WP_USER} --porcelain --path=${WP_PATH} --allow-root

exec /usr/sbin/php-fpm81 -F -R
