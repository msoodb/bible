#!/bin/bash

#####################################################################
# Subdomain Enumeration
#
# Input: 
#    1- core            main web application to be hacked
#    2- wildcards       domain without *. saved in file: wildcards
#
# Output: 
#    1- domains         subdomains
#    2- hosts           active subdomains/hosts
#    3- hosts.200       active subdomains/hosts 200
#    4- fff_out/        fetch headers and body of all hosts
#    5- urls            
#####################################################################


# Variables
export FILE=wildcards
export SECLISTS_DIR=/var/lib/snapd/snap/seclists/37
export WORDLIST_DIR=~/wordlist

##### Subdomain 

# crtsh
for Line in $(cat $FILE);do crtsh -d $Line -r >> "domains";done

# subfinder
subfinder -dL $FILE >> domains

# assetfinder
cat $FILE | assetfinder -subs-only >> domains

# subbrute
subbrute -s /usr/share/wordlists/subbrute/names.txt -r /usr/share/wordlists/subbrute/resolvers.txt  -t $FILE >> domains

# amass
for Line in $(cat $FILE);do amass enum -passive -d $Line >> "domains";done

# ffuf
#for Line in $(cat $FILE);do ffuf -u https://FUZZ.$Line -w $SECLISTS_DIR/Discovery/DNS/subdomains-top1million-5000.txt >> "domains";done

# Sort and Uniq domains
vim domains
:sort
:%!uniq


##### Probe #####

# httprobe
# cat domains | httprobe -c 50 > hosts

# httpx
httpx -l domains -sc -nc -o hosts
cat hosts | grep 200 | awk '{print $1}' > hosts.200    #Filter hosts

# fff
cat hosts.200 | fff -d 1 -S -o ./fff_out

# gf
gf aws-keys #base64, ....
grep -Rnw . -e "stringtofind"  # Find a string in current folder recursively


##### URLing #####

# waybackurls
cat hosts.200 | waybackurls | tee -a urls

# katana
katana -list hosts.200 | tee -a urls

# Sort and Uniq urls
vim urls
:sort
:%!uniq
