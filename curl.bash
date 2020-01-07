#!/bin/bash
while read url
do
    urlstatus=$(curl -o /dev/null --silent --head --write-out '%{http_code}' "$url" )
    echo "$url  $urlstatus" >> urlstatus.txt
done < $1

# type $./checkurls.sh urls.txt make sure urlstatus.txt is present!
