FROM php:7.4-fpm

RUN usermod -u 1000 www-data

RUN rm -rf /var/www/html

WORKDIR /var/www/

# Install system packages
RUN apt-get update && apt-get install -y \
    libonig-dev \
    libxml2-dev \    
    zlib1g-dev \
    libpng-dev \
    libbz2-dev \
    default-mysql-client\ 
    curl \
    zip \
    unzip

# Remove system packages cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install PHP extensions
RUN docker-php-ext-install bz2 \
    exif\
    pcntl \
    bcmath \
    gd \
    pdo \
    tokenizer \
    pdo_mysql

# Install laravel
RUN composer global require laravel/installer



COPY app .

RUN chown -R www-data:www-data .

USER www-data

RUN ln -s public html

EXPOSE 9000
#ENTRYPOINT [ "php", "artisan", "serve", "--host=0.0.0.0", "--port=8000" ]
ENTRYPOINT [ "php-fpm" ]