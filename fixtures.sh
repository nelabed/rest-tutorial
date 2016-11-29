#!/bin/sh
set -e
/bin/sh -c "while ! curl --output /dev/null --silent --head --fail http://172.25.0.1:3306; do sleep 1 && echo -n .; done;"
/bin/sh -c "php /app/app/console doctrine:schema:update --force && php /app/app/console doctrine:fixtures:load --no-interaction"