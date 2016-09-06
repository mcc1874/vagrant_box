#!/bin/bash

domain="local.www.moqiuchen.com"
root_path="/home/www/blog/Codeigniter"

cat << EOF > ${domain}.conf
server
{
    listen 80;
    server_name ${domain};
    index index.html index.htm index.php default.html default.htm default.php;
    root  ${root_path};

    include other.conf;
    #error_page   404   /404.html;
    include enable-php.conf;

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
    
    access_log  /home/wwwlogs/${domain}.log;
}
EOF

service nginx restart
                                                                                               