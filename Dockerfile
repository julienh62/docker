# Utiliser l'image PHP officielle
FROM php:8.1-fpm

# Installer les outils nécessaires
RUN apt-get update && apt-get install -y \
    curl \
    git \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
