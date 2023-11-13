#!/bin/bash

#####################################################################
# Scan
#
# Input: 
#    1- targets         main web application to be hacked
#
# targets ----> whatweb     ------->  wpscan/joomscan  ----> searchsploit
#               robots.txt  ------->  hidden dirs
#               sitemap.xml ------->  hidden dirs
#               index.html  ------->  sourcing
#               js          ------->  sourcing
#               gobuster    ------->  hidden dirs
#               nikto       ------->  vulnerability
#               nuclei      ------->  vulnerability
#               burp        ------->  req/res 
#               xssscan     ------->  ptential xss
#               sqlmap      ------->  ptential sqli
#####################################################################

# ----------------------------------
#   ~/Operations/<company>/<domain>
# ----------------------------------
init ()
{    
    export SECLISTS_DIR=/var/lib/snapd/snap/seclists/37
    export WORDLIST_DIR=~/wordlist
}

# ----------------------------------
#   ~/Operations/<company>/<domain>       
# ----------------------------------

# scan.sh basic <domain>
basic ()
{
    TARGET=$1

    # Domain Validation
    dig $TARGET > dig
    dig +short $TARGET > dig.short
    dig +short ns $TARGET > dig.short.ns
    dig +trace $TARGET > dig.trace

    # Sitemap
    curl -I https://$TARGET > response.headers
    https://securityheaders.com/?q=&followRedirects=on          # missing.headers
    wget https://$TARGET/robots.txt
    wget https://$TARGET/sitemap.xml

    # Tech 
    whatweb -v -a 3 https://$TARGET --log-verbose=whatweb --color=never   
    wappalyzer_varonis-com          # export from wappalyzer 
    wafw00f $TARGET > waf
    https://www.nmmapper.com/sys/reconnaissance-tools/waf/web-application-firewall-detector/   # WAF Detection
    
    # Auto Scan
    nuclei -u https://$TARGET  -nc -o nuclei
    nikto -h https://$TARGET -o nikto.output -Format txt
    nmap $TARGET 
    reverse.ip                      # https://hackertarget.com/reverse-ip-lookup/
    
    # Directory    
    gobuster dir -u https://$TARGET  -w $WORDLIST_DIR/common.txt > dirs
    curl -sS -D - https://$TARGET -o /dev/null
    ffuf -u https://$TARGET/FUZZ -w $WORDLIST_DIR/fuzz-lfi-params-list.txt -fc 30  # -fs 1-20 -s

    # URL
    katana -u https://$TARGET -fs=fqdn | tee -a urls

    # Javascript
    cat urls | subjs | tee -a jss~    
    cat jss~ | sort -u > jss && rm jss~

    # Screenshot
    gowitness file --file urls
    for I in $(ls); do 
        echo "$I" >> index.html;
        echo "<br/>" >> index.html;
        echo "<img src=$I><br>" >> index.html;
    done

    # OSINT
    zoomeye
    censys
    shodan

    # Known Bugs
    # 1- 
    subzy run --target urls
    socialhunter -f urls 

    # 2- XSS
    paramspider -d <domain>
    dalfox -b hahwul.xss.ht file param.txt

    # OWASP
    Burpsuite  - Scope: .*\.domain\.com$
}

"$@"
