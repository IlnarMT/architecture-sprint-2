#!/bin/bash

###
# Инициализируем бд
###

# Меняем рабочую директорию на ту, где находится скрипт
cd "$(dirname "$0")"

#Заполняем таблицу данными
docker compose exec -T mongos_router mongosh --port 27020 <<EOF
use somedb
for(var i = 0; i < 1000; i++) db.helloDoc.insertOne({age:i, name:"ly"+i})
EOF
