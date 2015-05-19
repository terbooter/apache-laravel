FROM php:5.6-apache
# libmcrypt-dev for mcrypt extension
# php5-dev for zip extension
RUN apt-get update && apt-get install -y git git-core libmcrypt-dev php5-dev

# zip for composer install from distr. mcrypt mbstring for laravel
RUN docker-php-ext-install mcrypt mbstring zip

# install composer globally and laravel installer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer global require "laravel/installer=~1.1"

RUN a2enmod rewrite

RUN mkdir -p /var/www/laravel-app
WORKDIR /var/www/laravel-app
ADD apache_vhost.conf /etc/apache2/sites-enabled/apache_vhost.conf
ADD install.sh install.sh