#!/bin/bash

FILE=""
LINES=$(cat $FILE)
declare -i i=1

for Line in $LINES
do    
    echo "subdomains.crtsh.$i"
    i=$i+1
done