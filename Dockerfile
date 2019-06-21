FROM wordpress:5.2.1-php7.1-apache

RUN apt-get update && apt-get install -y unzip zip
RUN curl --silent --show-error https://getcomposer.org/installer -o /composer-setup.php
RUN php /composer-setup.php --install-dir /usr/bin --filename composer
RUN rm /composer-setup.php

ENV WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST}
ENV WORDPRESS_DB_USER=${WORDPRESS_DB_USER}
ENV WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD}
ENV WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}
ENV WORDPRESS_TABLE_PREFIX=${WORDPRESS_TABLE_PREFIX}

EXPOSE 80