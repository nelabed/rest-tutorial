while ! curl -vs "http://$1:$2" 2>&1 | grep HTTP ; do sleep 1 && echo -n .; done; echo "DB is UP!"; php /app/app/console doctrine:database:create --if-not-exists &&  php /app/app/console doctrine:schema:update --force && php /app/app/console doctrine:fixtures:load --no-interaction --append;chown www-data:www-data -R /app /tmp;php-fpm