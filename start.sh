#!/bin/bash

#bash /start_consul_agent.sh &
#sleep 3

DB_HOST=$(consul kv get backend/db_address)
DB_USER=$(consul kv get backend/db_user)
DB_PASS=$(consul kv get backend/db_pass)

sed -i "s/{{ DB_USER }}/$DB_USER/g" /var/www/html/conexion.inc
sed -i "s/{{ DB_PASS }}/$DB_PASS/g" /var/www/html/conexion.inc
sed -i "s/{{ DB_HOST }}/$DB_HOST/g" /var/www/html/conexion.inc

WS_TABLE_COUNT=$(echo "select count(*) from TABLES where TABLE_NAME like 'ws_%';" | mysql -u DB_USER -h DB_HOST -pDB_PASS information_schema -N)
if [ "$WS_TABLE_COUNT" -lt "6" ]; then
	echo "Importing Viking tables";
	mysql -u $DB_USER -h $DB_HOST -p$DB_PASS kamailio < viking_voip_tables.sql
else
	echo "Not importing Viking tables";
fi

#service supervisor start
0
