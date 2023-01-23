# Port 

INPUT: IP
PROCESS:
- Find Open Ports
- Find Service and Version behind Open Ports
Tools:
- [nmap]
- [rustscan]
OUPUT: Ports and Services



## nmap
SCRIPTS:
```sh
# Common Ports and Services
export IP=xxx.xxx.xxx.xxx
nmap -oN nmap.common $IP
nmap -sV -sC -Pn -p 21,22, -oN nmap.common.details $IP
```

SCRIPTS:
```sh
# All Ports and Services
export IP=xxx.xxx.xxx.xxx
nmap -p- -v -oN nmap.all $IP
nmap -sV -sC -Pn -p 21,22, -oN nmap.all.details $IP
```

## rustscan