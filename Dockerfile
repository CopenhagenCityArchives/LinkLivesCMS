FROM wordpress:5.4.2-php7.3-apache

# Set environmental variables based on .env file or host environmentals
ENV WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST}
ENV WORDPRESS_DB_USER=${WORDPRESS_DB_USER}
ENV WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD}
ENV WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}
ENV WORDPRESS_TABLE_PREFIX=${WORDPRESS_TABLE_PREFIX}
ENV WORDPRESS_DEBUG=${WORDPRESS_DEBUG}
ENV WORDPRESS_SITEURL=${WORDPRESS_SITEURL}
ENV WORDPRESS_HOME=${WORDPRESS_HOME}

# PHP settings 
RUN echo "short_open_tag = Off" > $PHP_INI_DIR/conf.d/short_open_tag.ini
RUN echo "display_errors = stderr" > $PHP_INI_DIR/conf.d/error_output.ini

# Create wp-admin and wp-content dirs and add www-data as owner
RUN mkdir /var/www/html/wp-admin | true && chown -R www-data:www-data /var/www/html/wp-admin
RUN mkdir /var/www/html/wp-content | true && chown -R www-data:www-data /var/www/html/wp-content

# Download and unzip themes repository
# Copy to wp-content
# Install Composer packages and remove composer.phar
RUN apt-get update && \
    apt-get install unzip -y && \
    rm -Rf /tmp/linklives-wordpress-theme-master || true && \
    curl -o /tmp/linklivestemplate.zip -L https://github.com/CopenhagenCityArchives/linklives-wordpress-theme/archive/master.zip && \
    unzip -o /tmp/linklivestemplate.zip -d /tmp && \
    cp -r /tmp/linklives-wordpress-theme-master/wordpress/wp-content/themes/* /var/www/html/wp-content/themes && \
    rm -Rf /tmp/linklives-wordpress-theme-master || true && \
    curl -s https://getcomposer.org/installer | php && \
    php composer.phar install --ignore-platform-reqs -d /var/www/html/wp-content/themes/linklives/ && \
    rm composer.phar

# Set Wordpress config. FS_METHOD forces upgrade method to local. WP_HOME and WP_SITEURL defines location of the site. Is set during build in .travis.yml
ENV WORDPRESS_CONFIG_EXTRA="define('FS_METHOD', 'direct'); define('WP_HOME','{WORDPRESS_URL}'); define('WP_SITEURL','{WORDPRESS_URL}');"

EXPOSE 80
