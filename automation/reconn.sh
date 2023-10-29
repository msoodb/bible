#!/bin/bash

#####################################################################
# Subdomain Enumeration
#
# Input: 
#    1- domains         main web application to be hacked
#    2- wildcards       domain without *. saved in file: wildcards
#    2- outscopes       domain without *. saved in file: wildcards
#
# Output: 
#    1- subdomains      subdomains
#    2- hosts           active subdomains/hosts
#    3- fff_out/            fetch headers and body of all hosts
#    4- urls            
#####################################################################

#set -x
set +e

arg1=$1

init ()
{
    # Create files
    touch domains
    touch wildcards
    touch outscopes         # Out of Scope domains

    # Path
    export SECLISTS_DIR=/var/lib/snapd/snap/seclists/37
    export WORDLIST_DIR=~/wordlist
}

# No.1
sub ()
{
    echo "subdomain enumeration ........................ "

    # crtsh
    for LINE in $(cat wildcards);do crtsh -d $LINE -r >> "subdomains";done

    # subfinder
    subfinder -dL wildcards >> subdomains

    # assetfinder
    #
    cat wildcards | assetfinder -subs-only >> subdomains

    # subbrute
    #subbrute -s /usr/share/wordlists/subbrute/names -r /usr/share/wordlists/subbrute/resolvers  -t wildcards >> subdomains

    # amass
    #for LINE in $(cat wildcards);do amass enum -passive -d $LINE >> "subdomains";done

    # ffuf
    #
    #for LINE in $(cat wildcards);do ffuf -u https://FUZZ.$LINE -w $SECLISTS_DIR/Discovery/DNS/subdomains-top1million-5000 >> "subdomains";done

    # Add domains to subdomains. Domains are also In scope as well as subdomains
    if [ -f domains ]; then
        cat domains >> subdomains
    fi

    # Sort and Uniq subdomains
    cat subdomains | sort | uniq > subdomains~ && rm subdomains && mv subdomains~ subdomains

    # Remove OOScopes
    if [ -f outscopes ]; then
        for LINE in $(cat outscopes);do sed -i "/$LINE/d" subdomains;done
    fi
}

# No.2
host ()
{
    echo "host enumeration ........................ "

    # httprobe
    #cat domains | httprobe -c 50 > hosts

    # httpx
    httpx -l subdomains -nc -o hosts
    #cat hosts | grep 200 | awk '{print $1}' > hosts.200    #Filter hosts
}

# No.3
url ()
{
    echo "url enumeration ........................ "

    # waybackurls
    #cat hosts | waybackurls | tee -a urls

    # katana
    katana -list hosts -fs=fqdn | tee -a urls

    # Sort and Uniq urls
    cat urls | sort | uniq > urls~ && rm urls && mv urls~ urls
}

# No.4
js ()
{
    echo "js enumeration ........................ "
    
    # subjs
    cat urls | subjs | tee -a jss~

    # Sort and Uniq jss
    cat jss~ | sort -u > jss && rm jss~
}

# No.5
dns ()
{
    echo "dns enumeration ........................ "
}

# No.6
ans ()
{
    echo "ans enumeration ........................ "
    echo "https://bgp.he.net/"
}

##############################################
# Content Gathering
##############################################

crawl ()
{
    # fff
    cat hosts | fff -d 1 -S -o _.fff


    # directory
    for LINE in $(awk -F "//" '{print $2}' hosts);do mkdir -p $LINE; done

    # js
    file="jss"
    while IFS= read -r link
    do
        wget --tries=1 -P _.js/ "$link"
    done < "$file"

    echo "jsbeautifier-go"
    echo 'for FILE in _.js/*; do jsbeautifier-go $FILE > $FILE.btfy; done'
    echo

    echo "delete ugly js"
    echo 'find _.js/ -type f ! -name "*.btfy" -exec rm -r {} \;'
    echo    

    # Whatweb
    for LINE in $(awk -F "//" '{print $2}' hosts);
    do
        # whatweb
        whatweb -v -a 3 https://$LINE --log-verbose=$LINE/whatweb --color=never
        
        # robots
        wget --tries=1 -P $LINE/ $LINE/robots

        # sitemap.xml
        wget --tries=1 -P $LINE/ $LINE/sitemap.xml

        # index
        wget --tries=1 -P $LINE/ $LINE
    done

    # gobuster
    for LINE in $(awk -F "//" '{print $2}' hosts);
    do
        gobuster dir -u https://$LINE  -w $WORDLIST_DIR/common > $LINE/dirs
    done

    #
    # find whent it always return 200
    #
    #curl -sS -D - https://$TARGET_URL -o /dev/null
    #ffuf -u https://$TARGET_URL/FUZZ=1 -w $WORDLIST_DIR/fuzz-lfi-params-list -fs 1-20 -s

    # Vulnerability Scan
    nikto -h https://$TARGET_URL -o nikto -Format txt
    nuclei -u https://$TARGET_URL -nc -o nuclei

    # for LINE in $(awk -F ".s3" '{print $1}' s3-buckets);do aws s3 ls s3://$LINE --no-sign-request; done
}


"$@"
