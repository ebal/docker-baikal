#!/bin/bash

# ebal, Mon, 26 Feb 2024 18:27:49 +0200

mkdir -pv Specific/db config
# unless you have www-data user on your system
chown -R 777 Specific config
# chown -R www-data:www-data Specific config

docker run -d       \
    --name baikal   \
    -p 80:80        \
    -v "$PWD"/Specific:/var/www/html/baikal/Specific \
    -v "$PWD"/config:/var/www/html/baikal/config     \
    3bal/baikal:0.9.4

