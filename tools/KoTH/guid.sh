
mkdir ~/Prohacks/THM/Room
cd ~/Prohacks/THM/Room
sudo set.target.ip x.x.x.x
nmap.target.ip

gobuster dir --url http://$IP --wordlist /usr/share/seclists/Discovery/Web-Content/big.txt > gobuster.result
ftp anonymous@$IP
ssh jake@$IP
smbclient -L \\\\$IP
smbclient \\\\$IP\\anonymous
smbclient  -U  milesdyson //$IP/milesdyson
hydra -l jake -P /usr/share/wordlists/rockyou.txt ssh://$IP -o hydra.ssh.jake
hydra -l john -P /usr/share/wordlists/rockyou.txt $IP -s 62337 http-post-form "/components/user/controller.php?action=authenticate:username=john&password=^PASS^:Incorrect Username or Password" -o hydra.http.john
hydra -V -I -L usernames.txt -P log1.txt $IP  http-post-form "/squirrelmail/src/redirect.php:login_username=^USER^&secretkey=^PASS^&js_autodetect_results=1&just_logged_in=1:F=Unknown user or password incorrect." -o hydra.http

