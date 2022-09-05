#!/bin/bash

# Generate a random secret key
openssl rand -base64 32 > secret

# Recieve Bob's public key

# Encrypt the password file using Bob's public key
openssl rsautl -encrypt -in secret -out secret.enc -pubin -inkey bob_public.pem

# Send secret.enc to Bob. Alice and Bob have secret

# Encrypt the traffic using a symmetric algorithm (i.e. ae256) with the secret key
# echo 'Dear Bob If you get this message, please let me know. This is just the beginning. Alice' > plain.txt
openssl enc -e -aes256 -base64 -pbkdf2 -in plain.txt -out cipher.enc -kfile secret

# Send cipher.enc to Bob
