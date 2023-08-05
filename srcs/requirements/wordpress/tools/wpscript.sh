curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod 111 wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
chown -R www-data:www-data /var/www/html/wordpress


wp core download --path=$WP_PATH --allow-root
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$PASSWORD --dbhost=$DB_NAME --allow-root --path=$WP_PATH
sleep 2
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$PASSWORD --admin_email=$WP_EMAIL --locale=$WP_LANG --allow-root --skip-email --path=$WP_PATH
wp post create --post_type=post --post_title='TEST' --post_content='This is a test!' --post_status=publish --path=$WP_PATH --allow-root
wp theme install blogus --allow-root
wp theme activate blogus --allow-root
wp user create root root@1337.ma --role=administrator --user_pass=$PASSWORD --allow-root --path=$WP_PATH
wp user create user test@1337.ma --role=author --user_pass=$PASSWORD --allow-root --path=$WP_PATH
wp plugin install redis-cache --allow-root --path=$WP_PATH
sleep 1
wp redis enable --allow-root --path=$WP_PATH
wp config set WP_REDIS_HOST redis --add --type=constant --allow-root --path=$WP_PATH
wp config set WP_REDIS_PORT 6379 --add --type=constant --allow-root --path=$WP_PATH
wp config set WP_CACHE true --add --type=constant --allow-root --path=$WP_PATH
wp plugin activate redis-cache --allow-root --path=$WP_PATH
wp plugin update --all --allow-root --path=$WP_PATH

sleep 2

wp redis enable --allow-root --path=$WP_PATH
chmod 777 wp-content/
wp config set WP_DEBUG true --allow-root
wp config set WP_DEBUG_LOG true --allow-root
wp config set WP_DEBUG_DISPLAY true --allow-root
mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F
