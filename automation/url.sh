#!/bin/bash

# ----------------------------------
#   URLs Enumeration
# ----------------------------------

TARGET=$1

# waybackurls
echo $TARGET | waybackurls  | tee -a urls~

# katana
katana -u $TARGET -fs=fqdn | tee -a urls~

# pipes urls~ in a single file urls
cat urls~ | sort -u > urls && rm urls~


