FROM php:8.4-apache

# Fix outdated Debian sources
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/archive.debian.org/g' /etc/apt/sources.list

# Install dependencies, ImageMagick, PHP extensions
RUN apt-get update && apt-get install -y \
        mariadb-client \
        libssl-dev \
        --no-install-recommends \
    && docker-php-ext-install pdo pdo_mysql \
    && pecl install mongodb \
    && docker-php-ext-enable mongodb \
    && rm -rf /var/lib/apt/lists/*
