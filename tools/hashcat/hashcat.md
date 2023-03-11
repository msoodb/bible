
cat /etc/passwd > passwd.txt
cat /etc/shadow > shadow.txt
unshadow passwd.txt shadow.txt > unshadowed.txt
hashcat -m 1800 unshadowed.txt rockyou.txt -O



# hash with salt
hashcat -m 1710 -a 0 hash:salt /usr/share/wordlists/rockyou.txt
