# Shell 

INPUT
- service:user:pass
- vulnerability
- Reverse shell Script
PROCESS
- Exploit
- Gain Shell
    - Reverse Shell
    - Web Shell
    - SSH
- Stablish Shell
    - python
TOOLS
- msfconsole
- nc
- python
- hydra
- ssh
OUPUT
- Stablished shell


## Stablish Shell   
[python3]
    - <python -c 'import pty;pty.spawn("/bin/bash")'>
    - <export TERM=xterm>
    - Press Ctrl + Z to 'background' the netcat shell. This will return you to the terminal on the attacking computer.
    - <stty raw -echo;fg>
    - Ctrl + C
    - reset to undo the changes we made (stty raw -echo).
















    

