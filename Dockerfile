FROM wordpress:5.2.1-php7.1-apache

RUN apt-get update && apt-get install -y unzip zip

ENV WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST}
ENV WORDPRESS_DB_USER=${WORDPRESS_DB_USER}
ENV WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD}
ENV WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}
ENV WORDPRESS_TABLE_PREFIX=${WORDPRESS_TABLE_PREFIX}

# Pull LinkLives theme from Github
RUN curl -o /tmp/linklivestemplate.zip -L https://github.com/CopenhagenCityArchives/linklives-wordpress-theme/archive/master.zip

# Extract theme into themes folder and remove unused files
RUN cd /tmp && unzip -o linklivestemplate.zip && \
    mkdir -p /var/www/html/wp-content && \
    cp -r /tmp/linklives-wordpress-theme-master/wordpress/wp-content/* /var/www/html/wp-content && \
    ls -l /var/www/html/wp-content
#&& rm -rf linklivestemplate linklivestemplate.zip
EXPOSE 80