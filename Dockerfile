# VERSION      1

# FROM webts/centos_base
FROM centos:6

MAINTAINER webts

# update centos
RUN yum -y update
RUN yum -y install epel-release
# RUN yum install -y centos-release-SCL

# install required
RUN yum install -y httpd php php-gd php-mcrypt openssh-server openssl-devel wget rsync gcc php-devel php-pear make passwd php-mysql mod_ssl
# RUN yum install -y httpd php54 php54-php-gd php54-php-mcrypt openssh-server openssl-devel wget rsync gcc php54-php-devel php-pear make passwd php54-php-mysqlnd mod_ssl

#install mongo drivers
RUN pecl install mongo

#install redis drivers
RUN pecl install redis
#RUN cd /etc && echo "extension=redis.so" >> php.ini

#install zip drivers
RUN pecl install zip

# compress command
# RUN yum -y update && yum install -y httpd php-gd php-mcrypt openssh-server openssl-devel wget rsync gcc php-devel php-pear make passwd php-mysql mod_ssl && pecl install mongo-1.3.5 && pecl install redis && pecl install zip
# RUN yum -y update && yum install -y centos-release-SCL && yum install -y httpd php54 php54-php-gd php54-php-mcrypt openssh-server openssl-devel wget rsync gcc php54-php-devel php54-php-pear make passwd php54-php-mysqlnd mod_ssl && pecl install mongo && pecl install redis && pecl install zip
# RUN mv /etc/httpd/conf.d/php.conf /etc/httpd/conf.d/php53.off
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
