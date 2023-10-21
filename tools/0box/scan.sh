#!/bin/bash

#######################
# Subdomain Enumeration
#
# Input: 
#    1- domains         main web application to be hacked
#    2- wildcards       domain without *. saved in file: wildcards
#    2- ooscopes        domain without *. saved in file: wildcards
#    4- subdomains      subdomains
#    5- hosts           active subdomains/hosts
#    6- hosts.200       active subdomains/hosts 200
#    7- fff_out/        fetch headers and body of all hosts
#    8- urls            
#
# Output: 
#    1- robots.txt
#    2- sitemap.xml
#    3- index.html
#    4- ww
#    5- dir
#    6- nikto
#    7- nuclei
#######################

# Set Target url to scan
# It can be a domain, subdomain or url based on Reconn 
export TARGET_URL="xxxxx.xxx"

# Make dir 
mkdir $TARGET_URL && cd $TARGET_URL

# Set variables
export WORDLIST_DIR=~/wordlist

# whatweb
whatweb -v -a 3 https://$TARGET_URL --log-verbose=ww --color=never

# Download
wget https://$TARGET_URL/robots.txt
wget https://$TARGET_URL/sitemap.xml
wget https://$TARGET_URL

# Browser, View Source


# Directory fuzzing
gobuster dir -u https://$TARGET_URL  -w $WORDLIST_DIR/common.txt > dir

# find whent it always return 200 
    curl -sS -D - https://$TARGET_URL -o /dev/null

    ffuf -u https://$TARGET_URL/FUZZ=1 -w $WORDLIST_DIR/fuzz-lfi-params-list.txt -fs 1-20 -s


# API fuzzing

# Vulnerability Scan
nikto -h https://$TARGET_URL -o nikto -Format txt 
nuclei -u https://$TARGET_URL -nc -o nuclei

# searchsploit
searchsploit   "phrase"        # search for what you find interesting in whatweb, nikto, nuclei











#######################
# XSS Enumeration
#######################

# qsreplace
#cat endpoint.txt | qsreplace ‘“><img src=x onerror=alert(1)> | tee -a xss_fuzz.txt

# freq
#cat xss_fuzz.txt | freq | tee -a possible_xss.txt