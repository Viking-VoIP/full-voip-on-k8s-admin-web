#!/bin/bash

DB_ADDRESS=$(consul kv get backend/db_address)
DB_USER=$(consul kv get backend/db_user)
DB_PASS=$(consul kv get backend/db_pass)
DB_HOST=$(consul kv get backend/db_host)

sed -i "s/{{ DB_USER }}/$DB_USER/g" /var/www/html/conexion.inc
sed -i "s/{{ DB_PASS }}/$DB_PASS/g" /var/www/html/conexion.inc
sed -i "s/{{ DB_HOST }}/$DB_HOST/g" /var/www/html/conexion.inc

mysql -u $DB_USER -h $DB_HOST -p$DB_PASS kamailio < viking_voip_tables.sql

service apache2 start
