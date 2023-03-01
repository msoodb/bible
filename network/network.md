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
