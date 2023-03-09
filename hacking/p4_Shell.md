# Shell 

INPUT
- service:user:pass
- vulnerability
- Uploaded RShell Script
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
    - Inside the remote shell, run python -c 'import pty;pty.spawn("/bin/bash")'.
    - Run export TERM=xterm to set the xterm terminal emulator.
    - Press Ctrl + Z to 'background' the netcat shell. This will return you to the terminal on the attacking computer.
    - stty raw -echo;fg
    - Ctrl + C
    Once you are done with your netcat shell, and you return to the terminal on the attacking computer, you will need to run reset to undo the changes we made in step 6 (stty raw -echo).
















    

