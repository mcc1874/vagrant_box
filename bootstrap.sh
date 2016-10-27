﻿#!/usr/bin/env bash

# php.ini
sed -i 's/display_errors = Off/display_errors = On/g' /usr/local/php/etc/php.ini
# nginx.conf
sed -i 's/sendfile on/sendfile off/g' /usr/local/nginx/conf/nginx.conf

# nginx.conf
vhost_path="/usr/local/nginx/conf/vhost"
www_path="/vagrant/www"
wwwlogs_path="/vagrant/wwwlogs"

domain="www.test.com"
file_dir="test"
cat > $vhost_path/$domain.conf <<EOF
server
{
    listen 80;
    server_name $domain;
    index index.html index.htm index.php default.html default.htm default.php;
    root $www_path/$file_dir;

    #error_page   404   /404.html;

    include typecho.conf; #重写index.php
    include enable-php.conf;
    #include enable-php-pathinfo.conf; #开启pathinfo

    location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$
    {
        expires      30d;
    }

    location ~ .*\.(js|css)?$
    {
        expires      12h;
    }

    location ~ /\.
    {
        deny all;
    }
    access_log  $wwwlogs_path/$file_dir.log;
}
EOF


# Restart servers
service nginx restart
service php-fpm restart