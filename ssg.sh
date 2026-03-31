#!/bin/bash

docker compose up -d

rm -rf dist/
rm -rf httrack/

httrack http://localhost:8080 -O httrack "+*.localhost:8080/*" -v

mv httrack/localhost_8080 dist