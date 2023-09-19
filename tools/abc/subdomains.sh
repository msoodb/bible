#!/bin/bash

# ######################
# Subdomain Enumeraion
# ######################

FILE="wildcards"
LINES=$(cat $FILE)

## crtsh
for Line in $LINES
do    
    $(crtsh -d $Line -r >> "subdomains.all")     
done


## subfinder
subfinder -dL $FILE >> subdomains.all

## assetfinder
cat $FILE | assetfinder -subs-only >> subdomains.all

## subbrute
# subbrute -s /usr/share/wordlists/subbrute/names.txt -r /usr/share/wordlists/subbrute/resolvers.txt  -t $FILE -o subdomains.subbrute

## gobuster
# $(gobuster dns -d $Line  -w /usr/share/wordlists/dirb/common.txt >> subdomains.all)
# cat subdomains.gobuster | awk '{print $2}' > subdomains.gobuster


# ######################
# Sort and Uniq
# ######################
cat subdomains.all | sort | uniq > subdomains.uniq


## OUT of scope cleansing
# grep -v -x -f scope.OUT.url.static subdomains.sq > subdomains.1c
# grep -v ".rand.apnic.net" subdomains.1c > subdomains.2c
# grep -v ".labs.apnic.net" subdomains.2c > subdomains.3c 
# grep -v "*." subdomains.3c > subdomains.4c 


## httprobe
cat subdomains.uniq | httprobe -c 50 -prefer-https > subdomains.httprobe

## httpx-toolkit
httpx-toolkit -l subdomains.httprobe -sc -td -title -probe -ip -mc 200,301 -nc -o subdomains.httpx-toolkit

