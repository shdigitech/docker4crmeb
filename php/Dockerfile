FROM chialab/php:7.4-fpm

# Install supervisord
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    supervisor 

# Remove lists
RUN rm -rf /var/lib/apt/lists/*

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions bcmath gd fileinfo pcntl redis swoole uploadprogress

# Start supervisord
# CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

# COPY ./extensions/swoole_loader74.so /usr/local/lib/php/extensions/no-debug-non-zts-20190902/swoole_loader74.so