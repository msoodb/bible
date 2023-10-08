#!/bin/bash

#######################
# Subdomain Enumeration
#######################

# crtsh
for Line in $(cat wildcards);do;$(crtsh -d $Line -r >> "domains.dirty");done

# subfinder
subfinder -dL wildcards >> domains.dirty

# assetfinder
cat wildcards | assetfinder -subs-only >> domains.dirty

# subbrute
subbrute -s /usr/share/wordlists/subbrute/names.txt -r /usr/share/wordlists/subbrute/resolvers.txt  -t wildcards >> domains.dirty

# amass
for Line in $(cat wildcards);do;$(amass enum -passive -d $Line >> "domains.dirty");done

# ffuf
for Line in $(cat wildcards);do;$(ffuf -u http://FUZZ.$Line -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt >> "domains.dirty");done

# Sort and Uniq
cat domains.dirty | sort | uniq > domains

#######################
# Probe
#######################

## httprobe
cat domains | httprobe -c 50 > hosts

#######################
# Probe
#######################

## httpx
httpx -l hosts  -sc -td -title -probe -ip -mc 200,301 -nc -o httpx-hosts
httpx -l domains  -sc -td -title -probe -ip -mc 200,301 -nc -o httpx-domains
cat httpx-domains httpx-hosts | sort | uniq > httpx

## fff
cat hosts | fff -d 1 -S -o ./fff_out

#######################
# URLs
#######################

# waybackurls
cat hosts | waybackurls | tee -a urls

# katana
katana -list hosts | tee -a urls

#######################
# XSS Enumeration
#######################

# qsreplace
cat endpoint.txt | qsreplace ‘“><img src=x onerror=alert(1)> | tee -a xss_fuzz.txt

# freq
cat xss_fuzz.txt | freq | tee -a possible_xss.txt