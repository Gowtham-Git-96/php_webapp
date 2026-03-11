# Pull image from Dockerhub if the image is not locally present
FROM ubuntu:22.04    
RUN apt-get update -q
RUN apt-get -y upgrade -q 
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN DEBIAN_FRONTEND='noninteractive' apt-get install -y 
    apache2\
    php5.6
RUN apt-get install -y php5.6-mbstring php5.6-mcrypt php5.6-curl 
RUN apt-get install -y php5.6-mysql
RUN apt-get install -y unzip

RUN apt-get install -y cron
RUN systemctl enable cron

WORKDIR /var/www/html
COPY  ./index.php  /var/www/html/index.php

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log
RUN ln -sf /proc/self/fd/1 /var/log/apache2/error.log
RUN ln -sf /proc/self/fd/1 /var/log/apache2/other_vhosts_access.log

# RUN chmod +x  /home/peozzle/*.sh
# RUN /home/peozzle/configSys.sh

EXPOSE 80 443
# RUN echo "Listen 8080" >> /etc/apache2/ports.conf
CMD cron && /usr/sbin/apache2ctl -D FOREGROUND

