Scan and Enumerate Service

20,21              FTP     File Transfer Protocol                 TCP      
22                 SSH     Secure Shell                           TCP/UDP  
23                 Telnet                                         TCP      
25                 SMTP    Simple Mail Transfer Protocol          TCP      
50,51              IPSec   IPSec                                             
53                 DNS     Domain Name System                     TCP/UDP  
67,68              DHCP    Dynamic Host Configuration Protocol    UDP      
69                 TFTP    Trivial File Transfer Protocol         UDP      
80                 HTTP    HyperText Transfer Protocol            TCP      
110                POP3    Post Office Protocol                   TCP      
111                RPC     Remote Procedure Call                  TCP      
119                NNTP    Network News Transport Protocol        TCP      
123                NTP     Network Time Protocol                  UDP      
135-139                    NetBIOS                                TCP/UDP  
143                IMAP4   Internet Message Access Protocol       TCP/UDP  
161,162            SNMP    Simple Network Management Protocol     TCP/UDP  
389                LDAP    Lightweight Directory Access Protocol  TCP/UDP  
443                HTTPS   HTTP with Secure Sockets Layer, SSL    TCP/UDP  
445                SMB     Server Message Block                   TCP      
465                SMTP    Secure Simple Mail Transfer Protocol   TCP      
995                POP3S   Post Office Protocol                   TCP      
2049               NFS     Network File System                    TCP      
989,990            FTPS    FTP over SSL/TLS (implicit mode)       TCP      
3306               MySql   mysql                                  TCP      
3389               RDP     Remote Desktop Protocol                TCP/UDP  
6379               Redis   Redis                                  TCP      

SMB             [Enum4Linux]
                [smbclient]
                [nmap]         nmap --script smb-enum-shares.nse -p445 target.ip
                [VULNERABILITIES]
                    [CVE-2017-0143] [ms17-010]
                        - Remote Code Execution vulnerability in Microsoft SMBv1 servers
                        - https://www.exploit-db.com/exploits/43970
                        - https://www.exploit-db.com/exploits/42315

FTP             [ftp]
                    ftp user/anonymous to remote server 
                    put php-reverse-shell.php
                [hydra]: bruteforce the password of the FTP Server

Telnet          [telnet]
                [netcat]

HTTP            Browser
                    - Source
                    - Network
                    - javascript
                    - /robots.txt
                    - /sitemap.xml
                Directory fuzzing
                    - [dirb]
                    - [dirbuster]
                    - [gobuster]
                    - [wfuzz]
                    - [ffuf]
                    - [feroxbuster]
                [BurpSuite]
                    - Request
                    - Response
                [wpscan]: Wordpress CMS scan
                [Manual]: Find Web Applicatin Vulnerability:
                    - OWASP Top 10
                    - IDOR: Insecure Direct Object Reference
                        - plain
                        - base64
                        - hash https://crackstation.net
                        - Unpredictable
                    - FI: File inclusion
                        - Local File Inclusion: Attacker can include a malicious file only from the same server
                        - Remote File Inclusion
                    - PT: Path Traversal
                    - SSRF: Server-Side Request Forgery
                        - regular SSRF
                        - Blind SSRF
                    - XSS: Cross-site Scripting
                        - Proof Of Concept
                        - Session Stealing
                        - Key Logger
                        - Business Logic
                    - RCE: Remote Code Execution
                    - SQLi: SQL Injection
                        - In-Band SQL Injection
                        - Blind SQLi
                [whatweb]
                [nikto]: Vulnerability scanning
                [searchsploit]: Finding and web application vulnerabilities
                [hydra]: Brute Force Login
                [metasploit]: Finding and exploiting web application vulnerabilities
                [Password]: Authentication Attack
                    - [JtR]: Single Mode / Wordlist / Brute-Force
                    - [hydra]: Wordlist Attack
                    - [crunch]: Hybrid Dictionary Attack [crunch]
                    - [RainbowCrack]: Rainbow Tables http://project-rainbowcrack.com/table.htm
                [python]
                    - [2to3]: Convert pythonRecon2 to python3
                    - Run python expolit file again

NFS             [mount]: Mounting NFS shares <sudo mount -t nfs IP:share /tmp/mount/ -nolock>

SMTP            [msfconsole]

RPC             [nmap] <nmap -p 111 --script=nfs-ls,nfs-statfs,nfs-showmount target.ip>
                [rpcinfo] <rpcinfo target.ip>
                [showmount] <showmount -e target.ip>
                [mount] <sudo mount -t nfs target.ip:/share /mnt/nfs>
                [umount] <sudo umount -f -l /mnt/nfs>

SSH             [ssh]
                    - <ssh user@target.ip -p 22>
                    - <ssh -i id_rsa user@target.ip -p 1337>
                    - <ssh -i id_rsa -T user@target.ip -p 1337>
                [hydra]
                    - Brute Force Login
                [nmap] <nmap --script ssh-auth-methods target.ip>
                [john]
                    - ssh2john id_rsa > id_rsa.hash
                    - john -w=/usr/share/wordlists/rockyou.txt id_rsa.hash

MySql           [mysql]
                    - connet with root:root <mysql -u root -h target.ip -p>
                [msfconsole]
                [hydra]
                    Brute Force Login
 
Redis           [namp] <nmap --script redis-info -sV -p 6379 target.ip>
                [nc] 
                    - <nc -vn 10.10.10.10 6379>
                    - INFO
                [redis-cli]
                    - <redis-cli -h target.ip>
                    - INFO
                    - set password for redis 
                        - <config set requirepass p@ss$12E45>
                        - SAVE

POP3            [telnet] <telnet target.ip 110>