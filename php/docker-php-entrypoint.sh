#!/bin/bash
php think workerman start --d
php think timer start --d
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
php-fpm
