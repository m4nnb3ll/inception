# Install WP
if [ ! -f "${WP_PATH}/wp-config.php" ]; then

  # Download Wordpress
  wp core download --path=$WP_PATH --allow-root

  # Config wordpress database
  wp config create --dbname=$MDB_DB \
              --dbuser=$MDB_USER \
              --dbpass=$MDB_PWD \
              --dbhost=mariadb:3306 \
              --allow-root \
              --path=$WP_PATH

  # Config wordpress core
  wp core install --url="${WP_URL}" \
              --title="${WP_TITLE}" \
              --admin_user="${WP_ADMIN}" \
              --admin_password="${WP_ADMIN_PWD}" \
              --admin_email="${WP_ADMIN_MAIL}" \
              --allow-root \
              --path=$WP_PATH

  wp user create $WP_USER $WP_USER_MAIL \
              --allow-root \
              --path=$WP_PATH

fi

# Run PHP
mkdir -p /run/php
php-fpm7.4 -F
