FROM php:7.2-fpm

# Install mongoDB driver
RUN pecl install mongodb \
    && docker-php-ext-enable mongodb

# Install composer and put binary into $PATH
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/ \
    && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# intl
RUN apt-get update \
    && apt-get install -y git \
    && apt-get install -y libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) intl

# database
RUN docker-php-ext-install -j$(nproc) \
    mysqli \
    pdo \
    pdo_mysql

ENV PATH="~/.composer/vendor/bin:./vendor/bin:${PATH}"