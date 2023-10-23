#!/bin/bash

#######################
# Subdomain Enumeration
#
# Input: 
#    1- domains.txt         main web application to be hacked
#    2- wildcards.txt       domain without *. saved in file: wildcards
#    2- ooscopes.txt        domain without *. saved in file: wildcards
#    4- subdomains.txt      subdomains
#    5- hosts.txt           subdomains/hosts
#    8- urls.txt            
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

#export WORDLIST_DIR=~/wordlist

help ()
{
    echo "fff"
    echo "cat urls.txt | fff -d 1 -S -o zz.fff"
    echo

    echo "jsbeautifier-go"
    echo 'for FILE in zz.js/*; do jsbeautifier-go $FILE > $FILE.btfy; done'
    echo

    echo "delete ugly js"
    echo 'find zz.js/ -type f ! -name "*.btfy" -exec rm -r {} \;'
    echo
}


init ()
{
    for LINE in $(awk -F "//" '{print $2}' hosts.txt);
    do
        mkdir -p $LINE
    done
}

clean ()
{
    for LINE in $(awk -F "//" '{print $2}' hosts.txt);
    do
        [ -e $LINE ] && rm -r $LINE
    done
}

js ()
{
    file="jss.txt"
    while IFS= read -r link
    do
        wget -P zz.js/ "$link"
    done < "$file"    
}

scan ()
{
    # Whatweb
    for LINE in $(awk -F "//" '{print $2}' hosts.txt);
    do
        # whatweb
        whatweb -v -a 3 https://$LINE --log-verbose=$LINE/whatweb --color=never
        
        # robots.txt
        wget -P $LINE/ $LINE/robots.txt

        # sitemap.xml
        wget -P $LINE/ $LINE/sitemap.xml
    done
}

# Directory fuzzing
dir ()
{
    # Whatweb
    for LINE in $(awk -F "//" '{print $2}' hosts.txt);
    do
        gobuster dir -u https://$LINE  -w $WORDLIST_DIR/common.txt > $LINE/dirs
    done   
}

# Content Discovery


# gf
# gf aws-keys #base64, ....
# grep -Rnw . -e "stringtofind"  # Find a string in current folder recursively


# Download
#wget https://$TARGET_URL/robots.txt
#wget https://$TARGET_URL/sitemap.xml
#wget https://$TARGET_URL

# Browser, View Source


# Directory fuzzing
#gobuster dir -u https://$TARGET_URL  -w $WORDLIST_DIR/common.txt > dir

# find whent it always return 200 
#curl -sS -D - https://$TARGET_URL -o /dev/null
#ffuf -u https://$TARGET_URL/FUZZ=1 -w $WORDLIST_DIR/fuzz-lfi-params-list.txt -fs 1-20 -s


# API fuzzing

# Vulnerability Scan
#nikto -h https://$TARGET_URL -o nikto -Format txt 
#nuclei -u https://$TARGET_URL -nc -o nuclei

# searchsploit
#searchsploit   "phrase"        # search for what you find interesting in whatweb, nikto, nuclei




# Pass All Subdomains too S3 Scanner








#######################
# XSS Enumeration
#######################

# qsreplace
#cat endpoint.txt | qsreplace ‘“><img src=x onerror=alert(1)> | tee -a xss_fuzz.txt

# freq
#cat xss_fuzz.txt | freq | tee -a possible_xss.txt


"$@"