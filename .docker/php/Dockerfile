FROM php:7.4-fpm

# ////////////////////////////
# 	PECL Extensions install
# ////////////////////////////

RUN apt-get update \
  	&& apt-get install -y \
libcurl4-openssl-dev \
libxslt-dev \
libmcrypt-dev \
libicu-dev g++ \
libfreetype6-dev \
libjpeg62-turbo-dev \
libmcrypt-dev \
zlib1g-dev \
libxml2-dev \
curl \
zip 

RUN apt-get clean 

# ////////////////////////////
# 	PHP extensions install
# ////////////////////////////

RUN docker-php-ext-install \
	# bz2 \
# calendar \
# ctype \
# curl \
	# dba \
	# dom \
	# enchant \
# 	# exif \
# fileinfo \
# 	# filter \
# 	# ftp \
# intl \
# json \
# 	# ldap \
# mbstring \
mysqli \
	# oci8 \
	# odbc \
	# opcache \
	# pcntl \
	# pdo \
	# pdo_dblib \
	# pdo_firebird \
pdo_mysql
	# pdo_oci \
	# pdo_odbc \
	# pdo_pgsql \
	# pdo_sqlite \
	# pgsql phar \
	# posix pspell \
	# readline recode \
	# reflection \
# session \
# 	# shmop \
# 	# simplexml \
# 	# snmp \
# 	# soap \
# 	# sockets \
# 	# spl \
# 	# standard \
# 	# sysvmsg \
# 	# sysvsem \
# 	# sysvshm \
# 	# tidy \
# 	# tokenizer \
# 	# wddx \
# xml \
# 	# xmlreader \ 
