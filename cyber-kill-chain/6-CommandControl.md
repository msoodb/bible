
Command and Control

INPUT               |      PROCESS                  |   TOOLS                    |      OUTPUT
--------------------|-------------------------------|----------------------------|----------------------
Initail Access      |   Establish C2 Channel        |   Python                   |      C2
Backdoor            |   Priviledge Escalation       |   Vectors                  |      Backdoor
                    |                               |   Exploits                 |
                    |                               |   GTFOBins                 |
                    |                               |   Lib Hijacking            |
                    |                               |   Environment Variables    |

[C2]            Command and Control server

[Python]        Stablish Shell
                    python -c 'import pty;pty.spawn("/bin/bash")'
                    export TERM=xterm
                    Press Ctrl + Z
                    stty raw -echo;fg
                    Ctrl + C

[Vectors]        Manual Vector Finding
                    find / -type f -perm /4000 2>/dev/null                    
                    find / -type f -perm -u=s 2>/dev/null
                    find / -type f -user root -perm -u=s 2>/dev/null
                    find / -type f -perm -u=s -exec ls -ldb {} \; 2>/dev/null
                    sudo -l
                    sudo -V
                    cat .bash_history
                    cat /etc/passwd    
                Auto Vector Finding
                    linpeas.sh

[Exploits]
                cve-2017-16995
                CVE-2021-4034
                CVE-2014-4014
