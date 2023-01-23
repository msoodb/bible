[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)


|   | OSI          |                            |                    | TCP/IP       |   |  Protocols                                                 |
|-- |--            |--                          |--                  |--            |-- | --                                                         |
| 7 | Application  | H7+Data                    | Data               | Application  | 4 | HTTP, HTTPS, SMTP, POP3, IMAP, SSH, FTP, SNMP, Telnet, RDP |
| 6 | Presentation | H6+H7+Data                 | Data               |              |   |                                                            |
| 5 | Session      | H5+H6+H7+Data              | Data               |              |   |                                                            |
| 4 | Transport    | H4+H5+H6+H7+Data           | Segment / Datagram | Transport    | 3 | TCP, UDP                                                   |
| 3 | Network      | H3+H4+H5+H6+H7+Data        | Packet             | Internet     | 2 | IPv4, IPv6, ICMP, IPSec                                    |
| 2 | Data Link    | H2+H3+H4+H5+H6+H7+Data+T2  | Frame              |              |   |                                                            |
| 1 | Physical     |                            | Stream             | Link         | 1 | ARP, Ethernet(802.3), WiFi(802.11), DSL, Bluetooth         |
|   |              |                            |                    |              |   |                                                            |


| Port     |      Service name                                |  Transport protocol |
| ----     |      ---                                         |  --                 |
| 20, 21   |     File Transfer Protocol (FTP)                 |  TCP                |
| 22       |     Secure Shell (SSH)                           |  TCP and UDP        |
| 23       |     Telnet                                       |  TCP                |
| 25       |     Simple Mail Transfer Protocol (SMTP)         |  TCP                |
| 50, 51   |     IPSec                                        |                     |  
| 53       |     Domain Name System (DNS)                     |  TCP and UDP        |
| 67, 68   |     Dynamic Host Configuration Protocol (DHCP)   |  UDP                |
| 69       |     Trivial File Transfer Protocol (TFTP)        |  UDP                |
| 80       |     HyperText Transfer Protocol (HTTP)           |  TCP                |
| 110      |     Post Office Protocol (POP3)                  |  TCP                |
| 111      |     Remote Procedure Call (RPC)                  |  TCP                |
| 119      |     Network News Transport Protocol (NNTP)       |  TCP                |
| 123      |     Network Time Protocol (NTP)                  |  UDP                |
| 135-139  |     NetBIOS                                      |  TCP and UDP        |
| 143      |     Internet Message Access Protocol (IMAP4)     |  TCP and UDP        |
| 161, 162 |     Simple Network Management Protocol (SNMP)    |  TCP and UDP        |
| 389      |     Lightweight Directory Access Protocol        |  TCP and UDP        |
| 443      |     HTTP with Secure Sockets Layer (SSL)         |  TCP and UDP        |
| 445      |     Server Message Block (SMB)                   |  TCP                |
| 2049     |     Network File System (NFS)                    |  TCP                |
| 989, 990 |     FTP over SSL/TLS (implicit mode)             |  TCP                |
| 3389     |     Remote Desktop Protocol                      |  TCP and UDP        |
|          |                                                  |                     |


| Protocol |	Default Port |	Secured Protocol |	Default Port with TLS |
| ----     |      ---        |        ---        |     --                 |
| HTTP 	   |     80 	     |       HTTPS 	     |           443          |
| FTP 	   |     21          |	     FTPS 	     |           990          |
| SMTP 	   |     25 	     |       SMTPS 	     |           465          |
| POP3 	   |     110 	     |       POP3S 	     |           995          |
| IMAP 	   |     143 	     |       IMAPS 	     |           993          |


# basic toosla
- ping
- traceroute
- whois
- dig
- nslookup
- nmap
- tcpdump
- smb
- telnet
- ftp
- nfs
- smtp
- mysql
- postgresql
- http
- ssh

