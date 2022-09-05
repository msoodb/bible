# key file
openssl rand -hex 16 > secret 
openssl enc -e -aes-128-cbc -base64 -nosalt -pbkdf2 -in plain.txt -out cipher.enc -kfile secret

# key
openssl enc -aes-128-cbc -k nM12#lzQq -pbkdf2 -P -md sha1
openssl enc -e -aes-128-cbc -base64 -nosalt -pbkdf2 -in plain.txt -out cipher.enc -K 902FB4FDD1BCE80EE854DC28ECFAB7D2 -iv 485659B27D05358B77C6A8FBAC259E21

# passphrase
openssl enc -e -aes-128-cbc -base64 -nosalt -pbkdf2 -in plain.txt -out cipher.enc -k nbw1#lzQq21
