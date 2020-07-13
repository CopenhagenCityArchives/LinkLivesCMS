FROM wordpress:5.4.2-php7.3-apache

ENV WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST}
ENV WORDPRESS_DB_USER=${WORDPRESS_DB_USER}
ENV WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD}
ENV WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}
ENV WORDPRESS_TABLE_PREFIX=${WORDPRESS_TABLE_PREFIX}
ENV WORDPRESS_DEBUG=${WORDPRESS_DEBUG}
ENV WORDPRESS_SITEURL=${WORDPRESS_SITEURL}
ENV WORDPRESS_HOME=${WORDPRESS_HOME}

RUN echo "short_open_tag = Off" > $PHP_INI_DIR/conf.d/short_open_tag.ini
RUN echo "display_errors = stderr" > $PHP_INI_DIR/conf.d/error_output.ini

RUN mkdir /var/www/html/wp-admin | true && chown -R www-data:www-data /var/www/html/wp-admin
RUN mkdir /var/www/html/wp-content | true && chown -R www-data:www-data /var/www/html/wp-content

ENV WORDPRESS_CONFIG_EXTRA="define('FS_METHOD', 'direct'); define('WP_HOME','{WORDPRESS_URL}'); define('WP_SITEURL','{WORDPRESS_URL}');"

EXPOSE 80
