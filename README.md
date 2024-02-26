# docker-baikal
This dockerfile provides a base image for Baikal CalDav/CardDav server.

## sabre/baikal

This image is a simple php-apache docker container that runs [sabre/baikal](https://sabre.io/baikal/) caldav/carddav in tcp80.

- Needs to be behind an apache/nginx reverse proxy for TLS termination (eg. letsencrypt)
- Needs to manual (start.sh) create Specific & config folder to separate server configuration from code.

