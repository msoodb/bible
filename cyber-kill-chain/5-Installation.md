


INPUT               |      PROCESS                  |   TOOLS                    |   OUTPUT
--------------------|-------------------------------|----------------------------|----------------------
Initail Access      |   Establish Access            |   Python                   |   Establish Channel
                    |   Priviledge Escalation       |   Vectors                  |   Backdoor
                    |   Maintain Access             |   Exploits                 |
                    |                               |   GTFOBins                 |
                    |                               |   Lib Hijacking            |
                    |                               |   Environment Variables    |



# Establish Access
- Python
    python -c 'import pty;pty.spawn("/bin/bash")'
    export TERM=xterm
    Press Ctrl + Z
    stty raw -echo;fg
    Ctrl + C


# Priviledge Escalation
- Manual Vector Finding
    find / -type f -perm /4000 2>/dev/null                    
    find / -type f -perm -u=s 2>/dev/null
    find / -type f -user root -perm -u=s 2>/dev/null
    find / -type f -perm -u=s -exec ls -ldb {} \; 2>/dev/null
    sudo -l
    sudo -V
    cat .bash_history
    cat /etc/passwd    
- Auto Vector Finding
    linpeas.sh
- Priviledge Escalation
    cve-2017-16995
    CVE-2021-4034
    CVE-2014-4014
    GTFOBins

# Maintain Access
- Remote Access Trojan
- Backdoor