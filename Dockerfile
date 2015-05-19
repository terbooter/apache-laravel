FROM php:5.6-apache
RUN mkdir -p /var/www/laravel-app
ADD apache_vhost.conf /etc/apache2/sites-enabled/apache_vhost.conf
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN apt-get update && apt-get install -y git git-core
RUN apt-get update
RUN apt-get install -y libmcrypt-dev 
RUN docker-php-ext-install mcrypt mbstring

RUN apt-get install -y php5-dev 

RUN docker-php-ext-install zip

RUN composer global require "laravel/installer=~1.1"
WORKDIR /var/www/laravel-app
ADD install.sh install.sh

#TODO сделать репозиторий на докер хабе terbooter/laravel
#TODO для этого доделать этот докерфайл 