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



20,21              FTP     File Transfer Protocol                 TCP      
22                 SSH     Secure Shell                           TCP/UDP  
23                 Telnet                                         TCP      
25                 SMTP    Simple Mail Transfer Protocol          TCP      
50,51              IPSec   IPSec                                             
53                 DNS     Domain Name System                     TCP/UDP  
67,68              DHCP    Dynamic Host Configuration Protocol    UDP      
69                 TFTP    Trivial File Transfer Protocol         UDP      
80                 HTTP    HyperText Transfer Protocol            TCP      
110                POP3    Post Office Protocol                   TCP      
111                RPC     Remote Procedure Call                  TCP      
119                NNTP    Network News Transport Protocol        TCP      
123                NTP     Network Time Protocol                  UDP      
135-139                    NetBIOS                                TCP/UDP  
143                IMAP4   Internet Message Access Protocol       TCP/UDP  
161,162            SNMP    Simple Network Management Protocol     TCP/UDP  
389                LDAP    Lightweight Directory Access Protocol  TCP/UDP  
443                HTTPS   HTTP with Secure Sockets Layer, SSL    TCP/UDP  
445                SMB     Server Message Block                   TCP      
465                SMTP    Secure Simple Mail Transfer Protocol   TCP      
995                POP3S   Post Office Protocol                   TCP      
2049               NFS     Network File System                    TCP      
989,990            FTPS    FTP over SSL/TLS (implicit mode)       TCP      
3306               MySql   mysql                                  TCP      
3389               RDP     Remote Desktop Protocol                TCP/UDP  
6379               Redis   Redis                                  TCP      