#!/bin/bash


# Creating  keys
$ssh-keygen -t rsa -b 4096 -C "your.email@service.com"

# Extract public key from private key
$ssh-keygen -y -f /path/to/id_rsa

# How to Fix "WARNING: UNPROTECTED PRIVATE KEY FILE!" on Mac and Linux
$sudo chmod 600 /path/to/my/key.pem
