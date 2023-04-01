
# History
- 1972 arpanet
    - Peggy Carp hosts.txt restore all machine name
    - Jon Postel in Standorf uni. was responsible to update it and add new machine ip and name
    - All connected machine to arpanet pull the hosts.txt at meednight to get updated hosts.txt 
- 1981 internet
    - Dr. David Mills authored rfc 799, internet domain names
- 1985
    - Birth of modern dns system
    - Distributed dns system
- 1993
    - internet open for commercial use
    - Two root server for dns
        - made east
        - made west
    - netsol: Network Solution
        - responsible for made east and made west dns root server
        - seller of domain name
- today
    - DNS created as a replacement for /etc/hosts   
    - Domain System runs by non-government organization ngo.
    - 13 root server
    - when buy/lease a domain from a "registrar", a name will added to the domain name system
    - What are IANA responsibilities? In addition to global IP addressing, IANA is also responsible for domain name system (DNS) root zone management, autonomous system numbers and any "unique parameters and protocol values" for the internet community.

## Terminoligy
- Domain                    example
- Toplevel domain           com, net, org, ir
- machine name/subdomain    www, shop             
- Domain Name Server        The server tht is charge of domain. zone file, record for domain.
- Domain Trinity
    - registrant      the person applying to be the owner for a time, of a domain
    - registrar       ostensibly the other party from whom you, the registrant, buy the domain; 
    - registry        the place that officializes your ownership of your domain.
- ICANN

# What's DNS enumeration?
- DNS enumeration is one of the most popular reconnaissance tasks there is for building a profile of your target.
- In plain english, it's the act of detecting and enumerating all possible DNS records from a domain name. This includes 
    - hostnames, 
    - DNS record names, 
    - DNS record types, 
    - TTLs, 
    - IP addresses, 
    - and a bit more, depending on how much information you're looking for.
- With effective DNS enumeration, you can clone DNS zones manually, using scripts or by exploiting DNS zone transfer vulnerabilities, known as AXFR (Asynchronous Transfer Full Range) Transfer. This latter type of DNS transfer takes place when an attacker detects a misconfigured DNS server that is actually responding to AXFR requests.
- https://securitytrails.com/blog/dns-enumeration

## DNS Reconnaissance Techniques
- DNS Zone Transfer     axfr
- DNS Brute Force
- Reverse Lookup
- Cache Snooping
- Zone Walking

- DNS servers host zones. A DNS zone is a portion of the domain name space that is served by a DNS server. example.com with all its subdomains may be a zone. second.example.com may also be a separate zone.

# DNS Reconnaissance Tools
- host
    - host <domain-name>
    - host -t ns <domain-name>
    - host -t mx <domain-name>
    - host <ip>
        - Not Found:        Host <ip>.in-addr.arpa. not found: 3(NXDOMAIN)
        - Found:            <ip>.in-addr.arpa domain name pointer arn09s21-in-f14.1e100.net.
- nslookup
    - nslookup <domain-name><options>
    - nslookup -type=ns <domain-name>
    - nslookup -type=mx <domain-name>
        - type
            - any
            - A: Address Record maps a domain name to an IPv4 address.
            - AAAA: IPv6 Address Record maps a domain name to an IPv6 address.
            - CNAME: Canonical Name Record maps an alias to a real domain name.
            - MX: Mail Exchange Recordmaps a domain name to an email server.
            - NS: Name Server Record maps a domain name to a DNS server.
            - TXT: Text Record stores text information for a domain.
        - dns-server
            - Using a Specific DNS Server nslookup <domain-name> <dns-server>
        - Understanding the Output
            - Server                        127.0.0.53
            - Address:                      127.0.0.53#53    Port 53 is the standard port for DNS queries.
            - Non-authoritative answer      This answer is cached and forwarded from the local server that nslookup queried.
            - Records
- dig
    - dig <domain-name>
    - dig <domain-name> -t mx
    - dig <domain-name> -t ns +short
    - dig @8.8.8.8 +trace <domain-name>
    - dig -x <ip>
- dnsenum
    - dnsenum --noreverse -o file.xml <domain-name>
    - dnsenum --dnsserver ns3.p16.dynect.net <domain-name> -p 10 -s 50

# Config DNS Server in Linux
- cat /etc/hosts
- cat /etc/resolv.conf