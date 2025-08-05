#!/bin/bash

set -e


docker run --rm \
  --name mysql-temporario \
  -e MYSQL_ROOT_PASSWORD=senha123 \
  -e MYSQL_DATABASE=meubanco \
  -e MYSQL_USER=usuario \
  -e MYSQL_PASSWORD=senha123 \
  -p 3306:3306 \
  mysql:8.0.30
