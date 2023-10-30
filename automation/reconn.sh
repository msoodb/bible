#!/bin/bash

#####################################################################
# Subdomain Enumeration
#
# Input: 
#    1- domains         main web application subdomains to be hacked
#    2- wildcards       domain without *. saved in file: wildcards
#    3- outscopes       out of scope subdomain
#
# Output: 
#    1- targets         subdomains / ips
#
# domains
# wildcards --> subdomains --> hosts --> urls --> jss --> /js --> gf --> targets 
# outscopes                          --> /fff
#
#####################################################################

init ()
{
    touch domains
    touch wildcards
    touch outscopes
    export SECLISTS_DIR=/var/lib/snapd/snap/seclists/37
    export WORDLIST_DIR=~/wordlist
}

sub ()
{
    for LINE in $(cat wildcards);do crtsh -d $LINE -r >> "subdomains~";done
    subfinder -dL wildcards >> subdomains~
    cat wildcards | assetfinder -subs-only >> subdomains~
    cat subdomains~ | sort -u > subdomains && rm subdomains~
    if [ -f outscopes ]; then
        for LINE in $(cat outscopes);do sed -i "/$LINE/d" subdomains;done
    fi
}

url ()
{
    httpx -l subdomains -nc -o hosts
    katana -list hosts -fs=fqdn | tee -a urls~    # cat urls~ | sort -u > urls && rm urls~
    cat urls | subjs | tee -a jss~                #  cat jss~ | sort -u > jss && rm jss~
    
}

crawl ()
{
    cat hosts | fff -d 1 -S -o _.fff
    file="jss"
    while IFS= read -r link
    do
        wget --tries=1 -P _.js/ "$link"
    done < "$file"
}

"$@"
