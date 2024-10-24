FROM php:8.2-fpm

RUN apt update \
    && apt install -y zlib1g-dev g++ git libicu-dev zip libzip-dev curl openssl \
    && docker-php-ext-install intl opcache pdo pdo_mysql \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

ARG COUNTRY
ARG STATE
ARG CITY
ARG ORGANIZATION
ARG ORG_UNIT
ARG COMMON_NAME

ENV COUNTRY=${COUNTRY}
ENV STATE=${STATE}
ENV CITY=${CITY}
ENV ORGANIZATION=${ORGANIZATION}
ENV ORG_UNIT=${ORG_UNIT}
ENV COMMON_NAME=${COMMON_NAME}

RUN mkdir -p /etc/ssl/certs && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/certs/server.key -out /etc/ssl/certs/server.crt \
    -subj "/C=$COUNTRY/ST=$STATE/L=$CITY/O=$ORGANIZATION/OU=$ORG_UNIT/CN=$COMMON_NAME"

WORKDIR /var/www/scrumvoting

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs
