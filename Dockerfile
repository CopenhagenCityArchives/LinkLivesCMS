FROM wordpress:5.2.1-php7.1-apache

ENV WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST}
ENV WORDPRESS_DB_USER=${WORDPRESS_DB_USER}
ENV WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD}
ENV WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}
ENV WORDPRESS_TABLE_PREFIX=${WORDPRESS_TABLE_PREFIX}

# Pull LinkLives theme from Github
#RUN curl -o /tmp/linklivestemplate.zip -L https://github.com/copenhagencityarchives/LinkLivesWordpressTemplates

# Extract theme into themes folder and remove unused files
#RUN cd /tmp && unzip linklivestemplate.zip && mv linklivestemplate/wordpress/wp-content/themes/linklives/* ./wp-contents/themes/linklives && rm -rf linklivestemplate linklivestemplate.zip

EXPOSE 80