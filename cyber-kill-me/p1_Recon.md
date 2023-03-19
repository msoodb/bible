# Recon 

INPUT
- Company name
PROCESS
- Passive Reconnaissence.   Gather information WITHOUT touching target.
- Active Reconnaissence.    Gather information WITH touching target.
TOOLS
- Passive Recon Tools
- Passive Recon Online Tools
- Active Recon Tools
- Automated Recon Framework
OUTPUT
- Target IPs
- Information About Target as much as possible!


## Reconnaissence tools

Passive Recon Tools:
- [host]            IP addresses                        -
- [nslookup]        DNS information                     -
- [traceroute]      Displaying possible routes          -
- [dnsrecon]        Pssive mode                         dnsrecon -d site.com
- [wafw00f]         WAF information                     -
- [dig]             DNS information ANY/MX/TXT          -
- [whois]           Domain information                  -
- [DNSenum]         DNS information                     -
- [whatweb]         Website technology                  -
- [theHarvester]    OSINT platform                      theHarvester -d site.com -b all
- [sublist3r]       Subdomain enumeration               -
- [subfinder]       Subdomain enumeration               -
- [SocialMedia]     User information                    -

Passive Recon Online Tools:
- [netcraft]        Some usefull information            https://sitereport.netcraft.com
- [dnsdumpster]     DNS map information                 https://dnsdumpster.com
- [dnsleaktest]     DNS leak information                https://dnsleaktest.com
- [Wappalyzer]      Website technology                  https://addons.mozilla.org/en-US/firefox/addon/wappalyzer
- [BuiltWith]       Website technology                  https://addons.mozilla.org/fi/firefox/addon/builtwith
- [google]          Subdomain enumeration               https://www.google.com/> [site:*.bbc.com -site:www.bbc.com]
- [GHDB]            Google Hacking Database             https://www.exploit-db.com/google-hacking-database
- [archive]         Website History                     https://archive.org
- [ip2location]     Geo location                        https://www.ip2location.com
- [alerts]          Set google change alert             https://www.google.com/alerts
- [shodan]          Shodan                              https://www.shodan.io/dashboard
- [OSINT]           OSINT Framework                     https://osintframework.com


Active Recon Tools:
- [fping]           Ping Sweep                          -
- [ping]            IP addresses                        -
- [dnsrecon]        Active mode zone transfer           dnsrecon -d site.com -t axfr
- [fierce]          Active Subdomain enum brute-force   -
- [knockpy]         Active Subdomain enum brute-force   -

Automated Reconnaissance Framework
- [recon-ng]
- [maltego]
- [Sn1per]
- [amass]
- [centralops]      https://centralops.net

## References
[//]: # (References)
[mitre]             https://attack.mitre.org/
[hackertarget]      https://hackertarget.com/whatweb-scan/