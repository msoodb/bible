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

export WORDLIST_DIR=~/wordlist

help ()
{
    echo "fff"
    echo "cat urls.txt | fff -d 1 -S -o _.fff"
    echo

    echo "jsbeautifier-go"
    echo 'for FILE in _.js/*; do jsbeautifier-go $FILE > $FILE.btfy; done'
    echo

    echo "delete ugly js"
    echo 'find _.js/ -type f ! -name "*.btfy" -exec rm -r {} \;'
    echo
}


##############################################
# Content Gathering
##############################################

# No.1
init () 
{
    for LINE in $(awk -F "//" '{print $2}' hosts.txt);do mkdir -p $LINE; done
}


# No.2
js ()
{
    file="jss.txt"
    while IFS= read -r link
    do
        wget -P _.js/ "$link"
    done < "$file"    
}


basic ()
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

        # index
        wget -P $LINE/ $LINE
    done
}

# Directory fuzzing
dir ()
{
    # gobuster
    for LINE in $(awk -F "//" '{print $2}' hosts.txt);
    do
        gobuster dir -u https://$LINE  -w $WORDLIST_DIR/common.txt > $LINE/dirs
    done

    #
    # find whent it always return 200
    #
    #curl -sS -D - https://$TARGET_URL -o /dev/null
    #ffuf -u https://$TARGET_URL/FUZZ=1 -w $WORDLIST_DIR/fuzz-lfi-params-list.txt -fs 1-20 -s
}


vuln ()
{
    # Vulnerability Scan
    echo 'nikto -h https://$TARGET_URL -o nikto -Format txt'
    echo
    echo 'nuclei -u https://$TARGET_URL -nc -o nuclei'
    echo
}

gf ()
{
    # cd _.fff/
    gf s3-buckets > ../s3-buckets.txt
    gf aws-keys > ../aws-keys
    gf ip > ../ips.txt~ && awk -F ":" '{print $3}' ../ips.txt~ | sort -u > ../ips.txt && rm ../ip.txt~
    gf php-sinks > ../php-sinks.txt
    gf php-sources > ../php-sources.txt
    gf upload-fields > ../upload-fields.txt
    gf servers > ../servers.txt~ && cat ../servers.txt~ | sort -u > ../servers.txt && rm ../servers.txt~
    gf sec > ../sec.txt
    gf php-errors
    gf gf json-sec > ../json.sec
}

s3 ()
{
    for LINE in $(awk -F ".s3" '{print $1}' s3-buckets.txt);do aws s3 ls s3://$LINE --no-sign-request; done
}

##############################################
# Content Discovery
##############################################

# gf aws-keys                           #base64, ....
# grep -Rnw . -e "stringtofind"         # Find a string in current folder recursively
# Browser, View Source
# API fuzzing
# searchsploit                          # search for what you find interesting in whatweb, nikto, nuclei
# Pass All Subdomains too S3 Scanner



##############################################
# Clean
##############################################

clean ()
{
    for LINE in $(awk -F "//" '{print $2}' hosts.txt);
    do
        [ -e $LINE ] && rm -r $LINE
    done
}


#######################
# XSS Enumeration
#######################

# qsreplace
#cat endpoint.txt | qsreplace ‘“><img src=x onerror=alert(1)> | tee -a xss_fuzz.txt

# freq
#cat xss_fuzz.txt | freq | tee -a possible_xss.txt


#######################
# SQL Injection
#######################

"$@"