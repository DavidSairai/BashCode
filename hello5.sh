#!/bin/bash
# Author :@dsairai
# Date: 21 May 2019
if [ $# -lt 1 ] ; then
echo "Usage: $0 <name>"
exit 1
fi
echo "Hello $1"
exit 0
