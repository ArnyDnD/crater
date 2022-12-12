#!/bin/sh

cd /var/www
composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader

php artisan storage:link || true
php artisan key:generate --force
