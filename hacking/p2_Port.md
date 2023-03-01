# Port

INPUT
- Target IP
- Information About Target
PROCESS
- Set target.ip in /etc/hosts
    - sudo setip <x.x.x.x>
- Find Open Ports
- Find Service and Version behind Open Ports
TOOLS
- nmap
    - portip
        - port.xx.ftp
        - port.xx.ssh
        - nmap.vulns/
            - port.xx.ftp.vuln
            - port.xx.ssh.vuln
- rustscan
OUPUT
- Ports
- Services
- Potentail vulnerability

