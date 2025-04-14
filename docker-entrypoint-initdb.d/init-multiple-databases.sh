#!/bin/bash

# 创建三个数据库
mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS chatgpt_cool;
    CREATE DATABASE IF NOT EXISTS grok_cool;
    CREATE DATABASE IF NOT EXISTS dddd_cool;
    
    GRANT ALL PRIVILEGES ON chatgpt_cool.* TO '$MYSQL_USER'@'%';
    GRANT ALL PRIVILEGES ON grok_cool.* TO '$MYSQL_USER'@'%';
    GRANT ALL PRIVILEGES ON dddd_cool.* TO '$MYSQL_USER'@'%';
EOSQL

# 导入chatgpt_cool数据库
mysql -u root -p"$MYSQL_ROOT_PASSWORD" chatgpt_cool < /docker-entrypoint-initdb.d/chatgpt_cool.sql

# 导入grok_cool数据库
mysql -u root -p"$MYSQL_ROOT_PASSWORD" grok_cool < /docker-entrypoint-initdb.d/grok_cool.sql

# 导入dddd_cool数据库
mysql -u root -p"$MYSQL_ROOT_PASSWORD" dddd_cool < /docker-entrypoint-initdb.d/dddd_cool.sql
