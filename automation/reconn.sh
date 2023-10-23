#!/bin/bash

#####################################################################
# Subdomain Enumeration
#
# Input: 
#    1- domains.txt         main web application to be hacked
#    2- wildcards.txt       domain without *. saved in file: wildcards.txt
#    2- outscopes.txt       domain without *. saved in file: wildcards.txt
#
# Output: 
#    1- subdomains.txt      subdomains
#    2- hosts.txt           active subdomains.txt/hosts.txt
#    3- fff_out/            fetch headers and body of all hosts.txt
#    4- urls.txt            
#####################################################################

#set -x
set +e

arg1=$1

# No.1
sub ()
{
    echo "subdomain enumeration ........................ "

    # crtsh
    for LINE in $(cat wildcards.txt);do crtsh -d $LINE -r >> "subdomains.txt";done

    # subfinder
    subfinder -dL wildcards.txt >> subdomains.txt

    # assetfinder
    #
    cat wildcards.txt | assetfinder -subs-only >> subdomains.txt

    # subbrute
    #subbrute -s /usr/share/wordlists/subbrute/names.txt -r /usr/share/wordlists/subbrute/resolvers.txt  -t wildcards.txt >> subdomains.txt

    # amass
    #for LINE in $(cat wildcards.txt);do amass enum -passive -d $LINE >> "subdomains.txt";done

    # ffuf
    #
    #for LINE in $(cat wildcards.txt);do ffuf -u https://FUZZ.$LINE -w $SECLISTS_DIR/Discovery/DNS/subdomains.txt-top1million-5000.txt >> "subdomains.txt";done

    # Add domains.txt to subdomains.txt. Domains are also In scope as well as subdomains.txt
    if [ -f domains.txt ]; then
        cat domains.txt >> subdomains.txt
    fi

    # Sort and Uniq subdomains.txt
    cat subdomains.txt | sort | uniq > subdomains.txt~ && rm subdomains.txt && mv subdomains.txt~ subdomains.txt

    # Remove OOScopes
    if [ -f outscopes.txt ]; then
        for LINE in $(cat outscopes.txt);do sed -i "/$LINE/d" subdomains.txt;done
    fi
}

# No.2
host ()
{
    echo "host enumeration ........................ "

    # httprobe
    #cat domains.txt | httprobe -c 50 > hosts.txt

    # httpx
    httpx -l subdomains.txt -nc -o hosts.txt
    #cat hosts.txt | grep 200 | awk '{print $1}' > hosts.txt.200    #Filter hosts.txt
}

# No.3
url ()
{
    echo "url enumeration ........................ "

    # waybackurls
    cat hosts.txt | waybackurls | tee -a urls.txt

    # katana
    katana -list hosts.txt | tee -a urls.txt

    # Sort and Uniq urls.txt
    cat urls.txt | sort | uniq > urls.txt~ && rm urls.txt && mv urls.txt~ urls.txt
}

# No.4
js ()
{
    echo "js enumeration ........................ "
    
    # subjs
    cat urls.txt | subjs | tee -a jss.txt

    # Sort and Uniq jss.txt
    cat jss.txt | sort | uniq > jss.txt~ && rm jss.txt && mv jss.txt~ jss.txt
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


all ()
{
    sub
    host
    url
    js
    dns
    ans
}

clean ()
{
    [ -e subdomains.txt ] && rm subdomains.txt
    [ -e hosts.txt ] && rm hosts.txt
    [ -e urls.txt ] && rm urls.txt
    [ -e jss.txt ] && rm jss.txt
}

"$@"
