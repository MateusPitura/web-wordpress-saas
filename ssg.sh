#!/bin/bash

docker compose up -d

rm -rf dist/
rm -rf httrack/

httrack http://localhost:8080 -O httrack "+*.localhost:8080/*" -v

mv httrack/localhost_8080 dist

docker cp wp_app:/var/www/html/wp-content/plugins/elementor/assets/js/. ./dist/wp-content/plugins/elementor/assets/js

find dist/ -type f -exec sed -i 's|localhost:8080|saas.mateuspitura.com|g' {} +
find dist/ -type f ! -name "*.svg" -exec sed -i 's|http:|https:|g' {} +

cp public/CNAME dist/CNAME