#!/bin/bash

#######################
# Subdomain Enumeration
#
# Input: 
#    1- core            core web application url without schema
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

# Set core
echo "...." > core

# Variables
export TARGET_URL=$(cat core)
export WORDLIST_DIR=~/wordlist

# Download
wget https://$TARGET_URL/robots.txt
wget https://$TARGET_URL/sitemap.xml
wget https://$TARGET_URL

# whatweb
whatweb -v -a 3 https://$TARGET_URL --log-verbose=ww --color=never

# Browser, View Source


# Directory fuzzing
gobuster dir -u https://$TARGET_URL  -w $WORDLIST_DIR/common.txt > dir

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