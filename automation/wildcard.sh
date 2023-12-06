#!/bin/bash

#####################################################################
# Reconnaissance Wildcard
#   - <Wildcard>
#####################################################################

# ----------------------------------
#   ~/Operations/<company>/       
# ----------------------------------
init ()
{       
    touch domains
    touch wildcards
    touch outscopes
    touch policy
    touch notbook
    echo "complete information about company."
}


# ----------------------------------
#   ~/Operations/<company>/<wildcard>       
#   - Set outscopes for this <wildcard>
# ----------------------------------

# ----------------------------------
#  Wildcard Subdomains Enumeration
# ----------------------------------
sub ()
{
    WILDCARD=$1

    # crtsh
    crtsh -d $WILDCARD -r >> subdomains~

    # subfinder
    subfinder -d $WILDCARD >> subdomains~
    
    # assetfinder
    echo  $WILDCARD | assetfinder -subs-only >> subdomains~
    
    # github-subdomains
    github-subdomains -d $WILDCARD -t $GITHUB_TOKEN -o github-subdomains
    cat github-subdomains >> subdomains~ && rm github-subdomains

    # pipes subdomains~ in a single file subdomains
    cat subdomains~ | sort -u > subdomains && rm subdomains~

    # remove out of scopes 
    if [ -f outscopes ]; then
        for LINE in $(cat outscopes) ;do sed -i "/$LINE/d" subdomains;done
    fi  
}

# ----------------------------------
#   Wildcard Hosts Enumeration
# ----------------------------------
host ()
{
    # hosts
    httpx -l subdomains -nc -o hosts~
    cat subdomains | httprobe >> hosts~

    # pipes hosts~ in a single file subdomains
    cat hosts~ | sort -u > hosts && rm hosts~

    # hosts.meta
    httpx -l subdomains -sc -ip -probe -title -o hosts.meta
}

# ----------------------------------
#   Wildcard URLs Enumeration
# ----------------------------------
url ()
{
    # urls
    cat hosts | waybackurls  | tee -a urls~

    # remove out of scopes 
    if [ -f outscopes ]; then
        for LINE in $(cat outscopes) ;do sed -i "/$LINE/d" urls~;done
    fi  

    katana -list hosts -fs=fqdn | tee -a urls~

    # pipes urls~ in a single file urls
    cat urls~ | sort -u > urls && rm urls~
}

# ----------------------------------
#   Wildcard JSs Enumeration
# ----------------------------------
js ()
{
    # js files
    cat urls | subjs | tee -a jss~
    
    # pipes jss~ in a single file jss
    cat jss~ | sort -u > jss && rm jss~
}

# ----------------------------------
#   Capture Screenshot
# ----------------------------------
screenshot ()
{
    # gowitness
    gowitness file --file hosts
    for I in $(ls); do 
        echo "$I" >> index.html;
        echo "<br/>" >> index.html;
        echo "<img src=$I><br>" >> index.html;
    done
}

# ----------------------------------
#   Poke Hosts and JSs
# ----------------------------------
poke ()
{
    # fff    
    cat hosts | fff -d 1 -S -o fff

    # Bypass Cloudflare 403 if needed
    # Check Headers in curl http://httpbin.org/headers

    # get js files
    for LINE in $(cat jss);do wget --tries=1 -P js/ "$LINE" ;done
}


# ##########################################################
#   Analyse
# ##########################################################

analyse ()
{

    # Response Headers and Recommendation
        # X-Frame-Options: DENY
        # X-XSS-Protection: 0
        # X-Content-Type-Options: nosniff
        # Referrer-Policy: strict-origin-when-cross-origin
        # Content-Type: text/html; charset=UTF-8
        # Set-Cookie
        # Strict-Transport-Security: max-age=63072000; includeSubDomains; preload
        # Expect-CT     !!! Do not use it. Mozilla recommends avoiding it, and removing it from existing code if possible.
        # Content-Security-Policy   Content Security Policy is complex to configure and maintain.
        # Access-Control-Allow-Origin: https://yoursite.com
        # Cross-Origin-Opener-Policy: same-origin
        # Cross-Origin-Embedder-Policy: require-corp
        # Cross-Origin-Resource-Policy: same-site
        # Permissions-Policy: geolocation=(), camera=(), microphone=()
        # Permissions-Policy: interest-cohort=()
        # Server: webserver
        # X-Powered-By: 
        # X-AspNetMvc-Version
        # X-DNS-Prefetch-Control: off
        # Public-Key-Pins

    # Headers vulnerabilities
        # HTTP-HOST HEADER ATTACKS          https://infosecwriteups.com/http-host-header-attacks-55ca4b7786c

    
    # https://cheatsheetseries.owasp.org/cheatsheets/HTTP_Headers_Cheat_Sheet.html
    # https://portswigger.net/web-security/host-header/exploiting

    # SQLi
    #
    # Find an URL that potentially sends SQL queries, like this one:
    # http://w34ksite.com/products.php?category=1 this URL list products, regrouped in the category named 1
    grep '-iE' 'id=|select=|report=|role=|update=|query=|user=|name=|sort=|where=|search=|params=|process=|row=|view=|table=|from=|sel=|results=|sleep=|fetch=|order=|keyword=|column=|field=|delete=|string=|number=|filter='


    # XSS
    # XSStrike 
    python ~/Projects/XSStrike/xsstrike.py -u https://edu.varonis.com/lms/assets/14b8f2b0/uid=

    # General tools
    gf [awskey|base64|json-sec]
    grep "-roE" ""

    # AWS 3S
    gf 3s > s3-buckets
    for LINE in $(awk -F ".s3" '{print $1}' s3-buckets);do aws s3 ls s3://$LINE --no-sign-request; done
}

"$@"
