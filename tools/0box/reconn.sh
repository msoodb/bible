#!/bin/bash

#####################################################################
# Subdomain Enumeration
#
# Input: 
#    1- domains         main web application to be hacked
#    2- wildcards       domain without *. saved in file: wildcards
#    2- ooscopes        domain without *. saved in file: wildcards
#
# Output: 
#    1- subdomains      subdomains
#    2- hosts           active subdomains/hosts
#    3- hosts.200       active subdomains/hosts 200
#    4- fff_out/        fetch headers and body of all hosts
#    5- urls            
#####################################################################

# Create Input file
vim domains
vim wildcards
vim ooscopes


# Variables
export WILDCARDS=wildcards
export SECLISTS_DIR=/var/lib/snapd/snap/seclists/37
export WORDLIST_DIR=~/wordlist

##### Subdomain 

# crtsh
for Line in $(cat $WILDCARDS);do crtsh -d $Line -r >> "subdomains";done

# subfinder
subfinder -dL $WILDCARDS >> subdomains

# assetfinder
cat $WILDCARDS | assetfinder -subs-only >> subdomains

# subbrute
subbrute -s /usr/share/wordlists/subbrute/names.txt -r /usr/share/wordlists/subbrute/resolvers.txt  -t $WILDCARDS >> subdomains

# amass
for Line in $(cat $WILDCARDS);do amass enum -passive -d $Line >> "subdomains";done

# ffuf
#for Line in $(cat $WILDCARDS);do ffuf -u https://FUZZ.$Line -w $SECLISTS_DIR/Discovery/DNS/subdomains-top1million-5000.txt >> "subdomains";done

# Remove OOScopes
sed -i '/oossubdomain/d' subdomains

# Add domains to subdomains
# Why? because all domains are also In scope as well as subdomains
cat domasin >> subdomains

# Sort and Uniq subdomains
vim subdomains
:sort
:%!uniq





##### Probe #####
# httprobe
# cat domains | httprobe -c 50 > hosts

# httpx
httpx -l subdomains -nc -o hosts
# cat hosts | grep 200 | awk '{print $1}' > hosts.200    #Filter hosts

# fff
cat hosts | fff -d 1 -S -o ./fff_out

# gf
gf aws-keys #base64, ....
grep -Rnw . -e "stringtofind"  # Find a string in current folder recursively


##### URLing #####

# waybackurls
cat hosts | waybackurls | tee -a urls

# katana
katana -list hosts | tee -a urls

# Sort and Uniq urls
vim urls
:sort
:%!uniq
