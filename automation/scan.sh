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


crawl ()
{
    for LINE in $(awk -F "//" '{print $2}' targets);do mkdir -p $LINE; done
    for LINE in $(awk -F "//" '{print $2}' targets);
    do
        whatweb -v -a 3 https://$LINE --log-verbose=$LINE/whatweb --color=never
        wget --tries=1 -P $LINE/ $LINE/robots.txt
        wget --tries=1 -P $LINE/ $LINE/sitemap.xml
        wget --tries=1 -P $LINE/ $LINE
    done

    for LINE in $(awk -F "//" '{print $2}' hosts);
    do
        gobuster dir -u https://$LINE  -w $WORDLIST_DIR/common > $LINE/dirs
        # curl -sS -D - https://$TARGET_URL -o /dev/null
        # ffuf -u https://$TARGET_URL/FUZZ=1 -w $WORDLIST_DIR/fuzz-lfi-params-list -fs 1-20 -s
    done  

    nikto -h https://$TARGET_URL -o nikto -Format txt
    nuclei -u https://$TARGET_URL -nc -o nuclei
    # for LINE in $(awk -F ".s3" '{print $1}' s3-buckets);do aws s3 ls s3://$LINE --no-sign-request; done
}


crawl ()
{
    export TARGET=
    mkdir -p $TARGET && cd $TARGET
    
    whatweb -v -a 3 https://$TARGET --log-verbose=whatweb --color=never
    wget --tries=1 -P $TARGET/ robots.txt
    wget --tries=1 -P $TARGET/ sitemap.xml
    wget --tries=1 -P $TARGET/ 
   

    
    gobuster dir -u https://$TARGET  -w $WORDLIST_DIR/common > dirs
    # curl -sS -D - https://$TARGET_URL -o /dev/null
    # ffuf -u https://$TARGET_URL/FUZZ=1 -w $WORDLIST_DIR/fuzz-lfi-params-list -fs 1-20 -s

    nikto -h https://$TARGET -o nikto -Format txt
    nuclei -u https://$TARGET -nc -o nuclei
    # for LINE in $(awk -F ".s3" '{print $1}' s3-buckets);do aws s3 ls s3://$LINE --no-sign-request; done
}



"$@"
