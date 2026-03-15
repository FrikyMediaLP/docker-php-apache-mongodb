FROM php:8.4-apache

# Install dependencies, ImageMagick, PHP extensions
RUN apt-get update && apt-get install -y \
        mariadb-client \
        libssl-dev \
        libicu-dev \
        --no-install-recommends \
    && docker-php-ext-install pdo pdo_mysql intl \
    && pecl install mongodb \
    && docker-php-ext-enable mongodb \
