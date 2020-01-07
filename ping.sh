#!/bin/bash
# Author: @dsairai
# Script to ping server
# Created : 21 May 2019 
read -p "Which server should be pinged?  :" server_addr
ping c3 $server_addr 2>&1 > /dev/null ||  echo "$server_add is dead"
