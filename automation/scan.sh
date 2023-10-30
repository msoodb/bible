#!/bin/bash

#####################################################################
# Scan
#
# Input: 
#    1- targets         main web application to be hacked
#
# targets ---> whatweb ---> wpscan | joomscan  ----> metasploit
#         ---> robots.txt, sitemap.xml, index.html
#         ---> sourcing html, js
#         ---> fuzzing dir, api
#         ---> nikto
#         ---> nuclei
#         ---> burp
#         ---> xssscan
#         ---> sqlmap
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

"$@"
