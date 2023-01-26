FROM chialab/php:7.3-fpm

# Install supervisord
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    supervisor 

# Remove lists
RUN rm -rf /var/lib/apt/lists/*

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions imagick pcntl swoole uploadprogress
RUN docker-php-ext-enable bcmath imagick pcntl redis swoole

# Start supervisord
# CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

# for PHP 7.3
COPY ./extension/swoole_loader/swoole_loader73.so /usr/local/lib/php/extensions/no-debug-non-zts-20180731/swoole_loader73.so

# for PHP 7.4
# COPY ./extension/swoole_loader/swoole_loader74.so /usr/local/lib/php/extensions/no-debug-non-zts-20190902/swoole_loader74.so

