#!/bin/bash
# Author :@dsairai
# Welcome script to display to users
# Date: 21 May 2019
if [ $# -lt 1 ] ; then
read -p "Enter a name: "
name=$REPLY
else
name=$1
fi
echo "Hello $name"
exit 0
