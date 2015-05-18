from william/ubuntu:14.04

run DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get -y install nginx php5-mysql php5-fpm \
    php5-mcrypt php5-curl php5-cli php5-gd php5-imagick php5-json php5-memcached php5-redis && \
    apt-get -y clean

run sed -i 's/#.*cgi.fix_pathinfo.*/cgi.fix_pathinfo=0/' /etc/php5/fpm/php.ini
add nginx_default /etc/nginx/sites-available/default

run echo '<?php phpinfo(); ?>' > /usr/share/nginx/html/info.php
