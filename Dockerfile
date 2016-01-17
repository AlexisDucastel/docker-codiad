FROM php:5-apache
MAINTAINER Alexis Ducastel "alexis@ducastel.net"

RUN apt-get update \
	&& apt-get install libz-dev -y \
	&& docker-php-ext-install mbstring zip \
	&& apt-get clean

ADD codiad/ /var/www/html
RUN usermod -u 1001 www-data && groupmod -g 1001 www-data && chown -R www-data:www-data /var/www/html/
VOLUME /var/www/html/workspace
VOLUME /var/www/html/data
