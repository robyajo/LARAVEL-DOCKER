# Gunakan image dasar PHP 8.2 FPM
FROM php:8.2-fpm

# Install dependencies dasar
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    curl \
    git \
    libzip-dev \
    libpq-dev \
    libmcrypt-dev \
    libsqlite3-dev \
    nano \
    libcurl4-openssl-dev \
    libssl-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy source code jika diperlukan (opsional, karena sudah ada volume)
# COPY ./src /var/www

# Set permission folder Laravel
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www

# Expose port (optional, karena PHP-FPM tidak listen langsung)
EXPOSE 9000

# Jalankan PHP-FPM
CMD ["php-fpm"]
