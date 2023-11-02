#!/bin/bash

#####################################################################
# Wide Reconnaissance
#
# Input: 
#    1- domains         main web application subdomains to be hacked
#    2- wildcards       domain without *. saved in file: wildcards
#    3- outscopes       out of scope subdomain
#
# Output: 
#    1- targets         subdomains / ips
#
# domains  ----------------------------------------->
# wildcards ---> subdomains ---> hosts ---> urls ---> targets 
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

# ----------------------------------
#   Wide Recon on wildcards domain 
#       - subdomains
# ----------------------------------
sub ()
{
    # crtsh
    for LINE in $(cat wildcards);do crtsh -d $LINE -r >> "subdomains~";done

    # subfinder
    subfinder -dL wildcards >> subdomains~
    
    # assetfinder
    cat wildcards | assetfinder -subs-only >> subdomains~
    
    # pipes subdomains~ in a single file subdomains
    cat subdomains~ | sort -u > subdomains && rm subdomains~
    
    # remove out of scopes 
    if [ -f outscopes ]; then
        for LINE in $(cat outscopes);do sed -i "/$LINE/d" subdomains;done
    fi
}


# ----------------------------------
#   Wide Recon on wildcards domain
#       - hosts
#       - urls
#       - js files
# ----------------------------------
url ()
{
    # hosts
    httpx -l subdomains -nc -o hosts

    # urls
    cat hosts | waybackurls  | tee -a urls~
    katana -list hosts -fs=fqdn | tee -a urls~

    # pipes urls~ in a single file urls
    cat urls~ | sort -u > urls && rm urls~

    # js files
    cat urls | subjs | tee -a jss~              
    
    # pipes jss~ in a single file jss
    cat jss~ | sort -u > jss && rm jss~
}


subdomain takeovers

$ host subdomain.example.com
subdomain.example.com has address 192.30.252.153
subdomain.example.com has address 192.30.252.154
$ whois 192.30.252.153 | grep "Org-naame | orgName"
OrgName: GitHub, Inc.


# ----------------------------------
#   Wide Recon on wildcards domain
#       - fff/
#       - jss/
# ----------------------------------
crawl ()
{
    # fff    
    cat hosts | fff -d 1 -S -o fff   

    # Bypass Cloudflare 403 if needed
    # Check Headers in curl http://httpbin.org/headers

    # get js files
    for LINE in $(cat jss);do wget --tries=1 -P js/ "$LINE" ;done
}


# ##########################################################
#   Header
#   js
#   Host
#   URL
#   document
#   api
#   Source
#   OSINT google, github, censys, shodan, medium, twitter
# ##########################################################

dig ()
{
    gf
    grep
}

"$@"
