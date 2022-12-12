[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

# nmap
Nmap, Network Mapper is a network scanner created by Gordon Lyon used to discover hosts and services on a computer network by sending packets and analyzing the responses. 

<hr/>

## install nmap in Linux
```sh
dnf install nmap
nmap -V
```

## nmap command usage
```sh
nmap [Scan Type(s)] [Options] {target specification}
```

## nmap scenario -network
- Scan using Hostname
- Scan using IP Address
- Scan Multiple Hosts
- Scan a whole Subnet
- Scan Multiple Servers using last octet of IP address
- Scan list of Hosts from a File
- Scan an IP Address Range
- Scan Network Excluding Remote Hosts
- Find out Live hosts in a Network


## nmap scenario -host
- Scan OS information and Traceroute
- Enable OS Detection with Nmap
- Scan a Host to Detect Firewall
- Scan a Host to check its protected by Firewall
- Perform a Fast Scan
- Print Host interfaces and Routes

## nmap scenario -port
- Scan for specific Port
- Scan a TCP Port
- Scan a UDP Port
- Scan Multiple Ports
- Scan Ports Consecutively
- Scan Ports by Network Range
- Find Host Services version Numbers
- Scan remote hosts using TCP ACK (PA) and TCP Syn (PS)
- Scan Remote host for specific ports with TCP ACK
- Scan Remote host for specific ports with TCP Syn
- Perform a stealthy Scan
- Check most commonly used Ports with TCP Syn
- Perform a tcp null scan to fool a firewall

[https://www.tecmint.com/nmap-command-examples]

```sh
nmap scanme.nmap.org
nmap 45.33.32.156
nmap -v scanme.nmap.org
```

```sh
nmap [ip]
nmap -p0-65535 [ip]
nmap -p22,21,80,9999 -sV -sC -T4 -Pn -oA 10.10.254.138 10.10.254.138
/usr/share/nmap/scripts/acarsd-info.nse
/usr/share/nmap/scripts/address-info.nse
/usr/share/nmap/scripts/afp-brute.nse
nmap --script=default [ip]
nmap --script-help http-headers
nmap --script-help smb-vuln*
nmap -sC -sV -p445 10.10.254.138 --script=smb-vuln*
Nmap vulscan: https://github.com/scipag/vulscan -> /usr/share/nmap/scripts
Nmap-vulners:https://github.com/vulnersCom/nmap-vulners.git -> /usr/share/nmap/scripts
```
