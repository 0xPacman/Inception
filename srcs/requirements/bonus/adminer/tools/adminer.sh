curl -sL https://www.adminer.org/latest.php -o adminer.php
chmod 755 adminer.php
php -S 0.0.0.0:3111 adminer.php