# Scan 

INPUT
- Ports
- Services
- Information About Target
PROCESS
- Scan and Enumerate Service
    - smb
    - ftp
    - ssh
    - http/https
    - mysql
    - pop3/imap/
    - rpc
    - smtp
TOOLS
- Fuzzing tools
- burp suite
- nikto
- hydra
- john
- sqlmap
- searchsploit
- netcat
- mysql
- browser
- source
- python
OUPUT
- service:user:pass
- vulnerability
- Uploaded RShell Script


# Scan and Enumerate Service
| Port     |  abbr  |    Service name                                |  Transport protocol |
| ----     |   ---  |    ---                                         |  --                 |
| 20, 21   |   FTP  |   File Transfer Protocol                       |  TCP                |
| 22       |   SSH  |   Secure Shell                                 |  TCP and UDP        |
| 23       |        |   Telnet                                       |  TCP                |
| 25       |   SMTP |   Simple Mail Transfer Protocol                |  TCP                |
| 50, 51   |        |   IPSec                                        |                     |  
| 53       |   DNS  |   Domain Name System                           |  TCP and UDP        |
| 67, 68   |   DHCP |   Dynamic Host Configuration Protocol          |  UDP                |
| 69       |   TFTP |   Trivial File Transfer Protocol               |  UDP                |
| 80       |   HTTP |   HyperText Transfer Protocol                  |  TCP                |
| 110      |   POP3 |   Post Office Protocol                         |  TCP                |
| 111      |   RPC  |   Remote Procedure Call                        |  TCP                |
| 119      |   NNTP |   Network News Transport Protocol              |  TCP                |
| 123      |   NTP  |   Network Time Protocol                        |  UDP                |
| 135-139  |        |   NetBIOS                                      |  TCP and UDP        |
| 143      |  IMAP4 |   Internet Message Access Protocol             |  TCP and UDP        |
| 161, 162 |  SNMP  |   Simple Network Management Protocol           |  TCP and UDP        |
| 389      |  LDAP  |   Lightweight Directory Access Protocol        |  TCP and UDP        |
| 443      |   SSL  |   HTTP with Secure Sockets Layer               |  TCP and UDP        |
| 445      |   SMB  |   Server Message Block                         |  TCP                |
| 2049     |   NFS  |   Network File System                          |  TCP                |
| 989, 990 |   FTPS |   FTP over SSL/TLS (implicit mode)             |  TCP                |
| 3306     |  MySql |   mysql                                        |  TCP                |
| 3389     |   RDP  |   Remote Desktop Protocol                      |  TCP and UDP        |
|          |        |                                                |                     |

| Protocol |	Default Port |	Secured Protocol |	Default Port with TLS |
| ----     |      ---        |        ---        |     --                 |
| HTTP 	   |     80 	     |       HTTPS 	     |           443          |
| FTP 	   |     21          |	     FTPS 	     |           990          |
| SMTP 	   |     25 	     |       SMTPS 	     |           465          |
| POP3 	   |     110 	     |       POP3S 	     |           995          |
| IMAP 	   |     143 	     |       IMAPS 	     |           993          |

## SMB
- [Enum4Linux]
- [smbclient]
## FTP
- [ftp]: ftp user/anonymous to remote server 
- [hydra]: bruteforce the password of the FTP Server. 
## Telnet
- [telnet]
- [netcat]
## HTTP / Web-Application
- [Browser]
    - Source
    - Network
    - javascript
    - /robots.txt
    - /sitemap.xml
- Directory fuzzing
    - [dirb]
    - [dirbuster]
    - [gobuster]
    - [wfuzz]
    - [ffuf]
    - [feroxbuster]
- [BurpSuite]
    - Request
    - Response
- [wpscan]: Wordpress CMS scan
- [Manual]: Find Web Applicatin Vulnerability:
    - OWASP Top 10
    - IDOR: Insecure Direct Object Reference
        - plain
        - base64
        - hash <https://crackstation.net/>
        - Unpredictable
    - FI: File inclusion
        - Local File Inclusion
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
- [nikto]: Vulnerability scanning
- [searchsploit]: Finding and web application vulnerabilities
- [hydra]: Brute Force Login
- [metasploit]: Finding and exploiting web application vulnerabilities
- [Password]: Authentication Attack
    - [JtR]: Single Mode / Wordlist / Brute-Force
    - [hydra]: Wordlist Attack
    - [crunch]: Hybrid Dictionary Attack [crunch]
    - [RainbowCrack]: Rainbow Tables <http://project-rainbowcrack.com/table.htm>
- [python]
    - [2to3]: Convert pythonRecon2 to python3
    - Run python expolit file again
## NFS
- [mount]: Mounting NFS shares <sudo mount -t nfs IP:share /tmp/mount/ -nolock>
## SMTP
- [msfconsole]
## RPC
- [nmap] <nmap -p 111 --script=nfs-ls,nfs-statfs,nfs-showmount target.ip>
- [rpcinfo] <rpcinfo target.ip>
- [showmount] <showmount -e target.ip>
- [mount] <sudo mount -t nfs target.ip:/share /mnt/nfs>
- [umount] <sudo umount -f -l /mnt/nfs>
## SSH
- [ssh]: ssh to remote server <ssh user@target.ip>
- [hydra]: Brute Force Login
- [nmap] <nmap --script ssh-auth-methods target.ip>
- [john]
    - ssh2john
## MySql
- [mysql]: connet with root:root <mysql -u root -h target.ip -p>
- [msfconsole]
- [hydra]: Brute Force Login
## POP3
- [telnet] <telnet target.ip 110>
## IMAP


# Find Any Access Point
Vulnerability Scanning Tools and Public Repositories
- [Nessus]
- [Nexpose]
- [OpenVAS]
- [searchsploit]
- [ExploitDB] <https://www.exploit-db.com>
- [NVD] <https://nvd.nist.gov/vuln/search>
- [Mitre] <https://www.cve.org>
- [OVAL] <https://oval.cisecurity.org/repository>
- [rapid7] <https://www.rapid7.com/db/>
- [favicon] <https://wiki.owasp.org/index.php/OWASP_favicon_database>
Firefox network.security.ports.banned.override
- [ERR]: network.security.ports.banned.override > string : 22
Stegan files
- [Steghide]
- [binwalk]
Crack files and hashs
- [JtR]
    - ssh2john
    - zip2john