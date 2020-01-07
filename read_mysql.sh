#!/bin/bash
# Author :@dsairai
# Date: 21 May 2019
read -p "UserName:" user_name
read -sp "Passwotd:" mysql_pwd
echo
read -p "MySQL Command:" mysql_cmd
read -p  "MySQL DB:" mysql_db
mysql -u $user_name -p $mysql_pwd$mysql_db -e "$mysql_cmd"
