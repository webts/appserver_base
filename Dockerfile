# VERSION      1

FROM webts/centos_base

MAINTAINER webts

# # update centos
# RUN yum -y update
#
# # install required
# RUN yum install -y httpd php-gd php-mcrypt openssh-server openssl-devel wget rsync gcc php-devel php-pear make passwd php-mysql mod_ssl
#
# #install mongo drivers
# RUN pecl install mongo-1.3.5
#
# #install redis drivers
# RUN pecl install redis
# #RUN cd /etc && echo "extension=redis.so" >> php.ini
#
# #install zip drivers
# RUN pecl install zip

# compress command
RUN yum -y update && yum install -y httpd php-gd php-mcrypt openssh-server openssl-devel wget rsync gcc php-devel php-pear make passwd php-mysql mod_ssl && pecl install mongo-1.3.5 && pecl install redis && pecl install zip

ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
