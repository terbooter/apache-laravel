FROM php:5.6-apache
RUN apt-get update
RUN apt-get install -y git git-core \
                        libmcrypt-dev \
                        php5-dev \
                        libpng12-dev \
                        libfreetype6-dev \
                        libjpeg62-turbo-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include
RUN docker-php-ext-install mcrypt mbstring zip gd pdo_mysql

# install composer globally and laravel installer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer global require "laravel/installer=~1.1"

RUN a2enmod rewrite

RUN mkdir -p /var/www/laravel-app
WORKDIR /var/www/laravel-app
RUN rm /etc/apache2/sites-enabled/000-default.conf
ADD apache_vhost.conf /etc/apache2/sites-enabled/apache_vhost.conf
ADD install-laravel.sh /install-laravel.sh
RUN chmod a+x /install-laravel.sh