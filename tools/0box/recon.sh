#!/bin/bash

#####################################################################
# Subdomain Enumeration
#
# Input: 
#    1- wildcards       domain without *. saved in file: wildcards
#
# Output: 
#    1- domains         subdomains
#    2- hosts           active subdomains/hosts
#    3- httpx           active subdomains/hosts
#    4- fff_out/        fetch headers and body of all hosts
#    5- urls            
#####################################################################


# Variables
export FILE=wildcards

##### Subdomain 

# crtsh
for Line in $FILE;do $(crtsh -d $Line -r >> "domains.dirty");done

# subfinder
subfinder -dL $FILE >> domains.dirty

# assetfinder
cat $FILE | assetfinder -subs-only >> domains.dirty

# subbrute
subbrute -s /usr/share/wordlists/subbrute/names.txt -r /usr/share/wordlists/subbrute/resolvers.txt  -t $FILE >> domains.dirty

# amass
for Line in $FILE;do $(amass enum -passive -d $Line >> "domains.dirty");done

# ffuf
for Line in $FILE;do $(ffuf -u http://FUZZ.$Line -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt >> "domains.dirty");done

# Sort and Uniq
cat domains.dirty | sort | uniq > domains



##### Probe #####

# httprobe
cat domains | httprobe -c 50 > hosts

# httpx
httpx -l hosts  -sc -td -title -probe -ip -mc 200,301 -nc -o httpx-hosts
httpx -l domains  -sc -td -title -probe -ip -mc 200,301 -nc -o httpx-domains
cat httpx-domains httpx-hosts | sort | uniq > httpx

# fff
cat hosts | fff -d 1 -S -o ./fff_out



##### URLing #####

# waybackurls
cat hosts | waybackurls | tee -a urls

# katana
katana -list hosts | tee -a urls
