# Port 

INPUT: IP
- Set target.ip
PROCESS:
- Find Open Ports
- Find Service and Version behind Open Ports
Tools:
- [nmap]
- [rustscan]
OUPUT: Ports and Services
SCRIPT:
- sudo set.target.ip x.x.x.x
- nmap.target.ip

