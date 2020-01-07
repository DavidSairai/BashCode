#!/bin/bash

# The clock function I got from here:
# http://www.linuxandlife.com/2012/08/how-to-create-continuous-digital-clock.html
# 
# And then I wanted a script that would terminate on 'any key'
# http://stackoverflow.com/questions/5297638/bash-how-to-end-infinite-loop-with-any-key-pressed
#

if [ -t 0 ]; then stty -echo -icanon -icrnl time 0 min 0; fi

count=0
keypress=''
while [ "x$keypress" = "x" ]; do
  	echo -e \\b\\b\\b\\b\\b\\b\\b\\b`date +%T`\\c
	sleep 1
  	keypress="`cat -v`"
done

if [ -t 0 ]; then stty sane; fi

echo ""
exit 0