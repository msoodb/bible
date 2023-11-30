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

export SECLISTS_DIR=/var/lib/snapd/snap/seclists/37
export WORDLIST_DIR=~/wordlist

# ----------------------------------
#   ~/Operations/<company>/<domain>       
# ----------------------------------


Validation(){
    export TARGET=www.example.com

    # Domain Validation
    dig $TARGET > dig
    dig +short $TARGET > dig.short
    dig +short ns $TARGET > dig.short.ns
    dig +trace $TARGET > dig.trace
    host $TARGET > host
}



# ----------------------------------
#  ~/Operations/<company>/<domain>
# 
#  scan.sh info <domain>
# ----------------------------------

<<comment
 Testing for Information Gathering.

 Understanding the deployed configuration of the server hosting the
 web application is almost as important as the application security 
 testing itself. After all, an application chain is only as strong as its
 weakest link. Application platforms are wide and varied, but some key
 platform configuration errors can compromise the application in the
 same way an unsecured application can compromise the server.
comment

info ()
{
    TARGET=www.example.com
  
    # --------------------------------
    # OTG-INFO-002
    # --------------------------------
    #   
        # Fingerprint Web Server.
        # 1. Knowing the version and type of a running web server.
    #
    . curl -I https://$TARGET > response.headers
        - Server
            - Server: Apache/1.3.23
            - Server: Microsoft-IIS/5.0
            - Server: Sun-ONE-Web-Server/6.1
        - Headers ordering
    . Automate
        . https://net-square.com/httprint.html
    . Online 
        . https://www.netcraft.com/
        . https://www.wappalyzer.com
        . https://securityheaders.com/?q=&followRedirects=on  #missing.headers


    # --------------------------------
    # OTG-INFO-003
    # --------------------------------
    #   
        # Review Webserver Metafiles for Information Leakage
        # 1. Information leakage of the web application’s directory or folder path(s).
        # 2. Create the list of directories that are to be avoided by Spiders, Robots, or Crawlers.
    #
    . wget https://$TARGET/robots.txt
    . wget https://$TARGET/sitemap.xml
    . rockspider.pl -www $TARGET
    . META Tag
        . <META NAME="ROBOTS">
        . Burpsuite <META> Tags
        . Browser (View Source function)


    # --------------------------------
    # OTG-INFO-004
    # --------------------------------
    #   
        # Enumerate the applications within scope that exist on a web server.
        # Web application discovery is a process aimed at identifying web applications on a given infrastructure.
        # 1. Different base URL
        # 2. Non-standard ports
        # 3. Virtual hosts
    #
    . katana -u https://$TARGET -fs=fqdn | tee -a urls
    . nmap $TARGET
    . https://api.hackertarget.com/reverseiplookup/?q=$IP #ip.reverse


    # --------------------------------
    # OTG-INFO-005
    # --------------------------------
    #   
        # Review webpage comments and metadata for information leakage.
        # 1. Source code
    #
    . Browser view source comment
        . <!--      -->
        . /*     */
        . //        
    . HTML version information <!DOCTYPE HTML
        • “strict.dtd” -- default strict DTD
        • “loose.dtd” -- loose DTD
        • “frameset.dtd” -- DTD for frameset documents
    . Burpsuite <META> Tags
        . <META name=”Author” content=”Andrew Muller”>
        . <META http-equiv=”Expires” content=”Fri, 21 Dec 201212:34:56 GMT”>
        . <META http-equiv=”Cache-Control” content=”no-cache”>
        . <META http-equiv=”Refresh” content=”15;URL=https://www.owasp.org/index.html”>
        . <META name=”robots” content=”none”>

    # --------------------------------
    # OTG-INFO-006
    # --------------------------------
    #   
        # Identify application entry points.
        # Understand how requests, responses are formed.
    #
    . URLs
        katana -u https://$TARGET -fs=fqdn | tee -a urls
        paramspider -d $TARGET
        waybackurls $TARGET | tee -a urls.wayback
        cat urls.wayback | sort -u > urls.wayback.su
        cat urls.wayback.su | grep -E "^http.?://www\.example\.com" > urls.wayback.su.inscope
    . ZAP
    . Burp Suite


    # --------------------------------
    # OTG-INFO-007
    # --------------------------------
    #   
        # Map execution paths through application.
        #
        # Before commencing security testing, understanding the structure  of the 
        # application is paramount. Without a thorough understanding of the layout 
        # of the application, it is unlkely that it will be tested thoroughly.
            # 1. Path - test each of the paths through an application that includes
                # combinatorial and boundary value analysis testing for each decision path. 
            # 2. Data flow (or taint analysis) - tests the assignment of variables via
                # external interaction (normally users).
            # 3. Race - tests multiple concurrent instances of the application
                # manipulating the same data.
    #
    • Burp Suite
        . Site map
    • ZAP
    • Diagramming software
    • URLs
    • Screenshot
        gowitness file --file urls
        for I in $(ls); do 
            echo "$I" >> index.html;
            echo "<br/>" >> index.html;
            echo "<img src=$I><br>" >> index.html;
            echo "<hr/>" >> index.html;
        done
  

    # --------------------------------
    # OTG-INFO-008
    # --------------------------------
    #   
        # Fingerprint Web Application Framework.
        # To define type of used web framework so as to have a better understanding of the security testing methodology.
            # 1. Web Application Frameworks - WAF 
            # 2. Content Management Systems - CMS
    #
    • HTTP headers                      
        - X-Powered-By: Mono
        - X-Generator: Swiftlet
    • Cookies
        - CAKEPHP=rm72kprivgmau5fmjdesbuqi71
    • HTML source code
    • Specific files and folders
    • WhatWeb                                       # https://morningstarsecurity.com/research/whatweb
    • Wappalyzer


    # --------------------------------
    # OTG-INFO-009
    # --------------------------------
    #   
        # Fingerprint Web Application.
        # Identify the web application and version to determine known vulnerabilities and the appropriate exploits to use during testing.
            # 1. Cookies             
            # 2. HTML source code              
                # <meta name=”generator” content=”WordPress 3.9.2” />
            # 3. Specific files and folders
                # WordPress-specific folders
    #
    • Cookies
        - phpBB             phpbb3_
        - Wordpress         wp-settings
        - 1C-Bitrix         BITRIX_
        - AMPcms            AMP
        - Django CMS        django
        - DotNetNuke        DotNetNukeAnonymous
        - e107              e107
        - EPiServer         EPiTrace, EPiServer
        - Graffiti CMS      graffitibot
        - Hotaru CMS        hotaru_mobile
        - ImpressCMS        ICMSession
        - Indico            MAKACSESSION
        - InstantCMS        InstantCMS[logdate]
        - Kentico CMS       CMSPreferredCulture
        - MODx              SN4[12symb]
        - TYPO3             fe_typo_user
        - Dynamicweb        Dynamicweb
        - LEPTON            lep[some_numeric_value]+sessionid
        - Wix               Domain=.wix.com
        - VIVVO             VivvoSessionId        
    • WhatWeb
    • BlindElephant.py
    • Wappalyzer
    • HTML source code
        - Wordpress         <meta name=”generator” content=”WordPress 3.9.2” />
        - phpBB             <body id=”phpbb”
        - Mediawiki         <meta name=”generator” content=”MediaWiki 1.21.9” />
        - Joomla            <meta name=”generator” content=”Joomla! - Open Source Content Management” />
        - Drupal            <meta name=”Generator” content=”Drupal 7 (http://drupal.org)” />
        - DotNetNuke        DNN Platform - http://www.dnnsoftware.com
    • Specific files and folders
        - Wordpress         /wp-includes/, /wp-admin/ and /wp-content/

    # --------------------------------
    # OTG-INFO-010
    # --------------------------------
    #   
        # Map Application Architecture.
    #
    • WAFW00F
    • Nmap
}


# ----------------------------------
#   ~/Operations/<company>/<domain>       
# ----------------------------------
# scan.sh scan <domain>
scan ()
{
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

    # JWT
    JWT Editor in Burp
    python jwt_tool.py <JWT>

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

    # File upload vulnerabilities
    webshell.php  - filename="exploit.php%00.jpg"

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
    # WebSockets
    # Web cache poisoning
    # Insecure deserialization
    # Information disclosure
    # Business logic vulnerabilities
    # HTTP Host header attacks
    # OAuth authentication
    # Prototype pollution
    # GraphQL API vulnerabilities
    # Race conditions
    # NoSQL injection
  
}


# --------------------------------
# Business logic
# --------------------------------
logic (){
    # Business logic vulnerabilities
}

"$@"
