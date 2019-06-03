FROM php:7.2

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && \
    apt-get install -y git

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer