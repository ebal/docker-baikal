# Multi-stage build, see https://docs.docker.com/develop/develop-images/multistage-build/
FROM alpine AS builder

ENV VERSION 0.9.4

ADD https://github.com/sabre-io/Baikal/releases/download/$VERSION/baikal-$VERSION.zip .
RUN apk add unzip && unzip -q baikal-$VERSION.zip

# Final Docker image
FROM php:8.2-apache

LABEL description="Baikal is a Cal and CardDAV server, based on sabre/dav, that includes an administrative interface for easy management."
LABEL version=$VERSION
LABEL website="http://sabre.io/baikal/"

# Install Baikal and required dependencies
COPY --from=builder --chown=www-data:www-data baikal /var/www/html/baikal

# Expose HTTPS & data directory
WORKDIR /var/www/html/baikal/

EXPOSE 80
CMD ["apache2-foreground"]
