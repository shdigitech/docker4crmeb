FROM chialab/php:7.4-fpm

# Change apt source to Aliyun
RUN echo \
    deb http://mirrors.aliyun.com/debian/ bullseye main non-free contrib\
    deb-src http://mirrors.aliyun.com/debian/ bullseye main non-free contrib\
    deb http://mirrors.aliyun.com/debian-security bullseye/updates main\
    deb-src http://mirrors.aliyun.com/debian-security bullseye/updates main\
    deb http://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib\
    deb-src http://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib\
    deb http://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib\
    deb-src http://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib\
    > /etc/apt/sources.list

# Install supervisord
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    supervisor 

# Remove lists
RUN rm -rf /var/lib/apt/lists/*

# Install and Enable php extensions
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions pcntl swoole uploadprogress
RUN docker-php-ext-enable imagick pcntl redis swoole