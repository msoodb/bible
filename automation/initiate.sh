#!/bin/bash

#####################################################################
# Initiate
#
# Output: 
#    1- domains         main web application to be hacked
#    2- wildcards       domain without *. saved in file: wildcards
#    2- outscopes       domain without *. saved in file: wildcards
#    
#####################################################################

# Create files
touch domains.txt
touch wildcards.txt
touch outscopes.txt         # Out of Scope domains

# Path
export SECLISTS_DIR=/var/lib/snapd/snap/seclists/37
export WORDLIST_DIR=~/wordlist