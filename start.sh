#!/bin/bash

SERVER_NAME=${SERVER_NAME:-"wiki.test.org"}

chown -R nginx:nginx /var/www/wiki/images/

cp /settings/LocalSettings.php /var/www/wiki/

# http://www.mediawiki.org/wiki/Manual:Security
sed -i 's/allow_url_fopen = [A-z.-]*/allow_url_fopen = Off/g' /etc/php.ini

cat >/etc/nginx/conf.d/mediawiki.conf<<EOF
server {
        server_name $SERVER_NAME;
        root /var/www;
 
        client_max_body_size 5m;
        client_body_timeout 60;
 
        location / {
                rewrite ^/$ /w/ permanent;
        }
 
        location /w/ {
                rewrite ^/w/(.*)\$ /wiki/index.php?title=\$1&\$args;
        }
 
        location ^~ /maintenance/ {
                return 403;
        }
        # this will secure the MediaWiki uploads against arbitrary PHP injection attacks:
        location /images/ {
                location ~.*\.(php)?$ {
                        deny all;
                }
        }
        location ~ [^/]\.php(/|\$) {
                fastcgi_split_path_info ^(.+?\.php)(/.*)$;
                if (!-f \$document_root\$fastcgi_script_name) {
                        return 404;
                }
                fastcgi_pass 127.0.0.1:9000;
                fastcgi_index index.php;
                include fastcgi_params;
        }
 
        location ^~ /cache/ {
                deny all;
        }
}
EOF

supervisord -c /etc/supervisord.conf
