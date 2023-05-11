FROM php:apache
LABEL authors="Nick"

# Install and enable mysqli extension
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Enable mod_rewrite for .htaccess
RUN a2enmod rewrite

COPY ./api /api
COPY ./api/.htaccess /var/www/html/.htaccess
WORKDIR /api

ENV PORT=8000

EXPOSE 8000

#CMD [ "php", "-S", "localhost:8000" ]
CMD ["php", "-S", "0.0.0.0:8000", "-t", "/api"]