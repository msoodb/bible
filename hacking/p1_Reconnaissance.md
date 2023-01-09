
Goal:
- Gather as much information about a target as possible!

Reconnaissence Methods:
- Passive: gather information WITHOUT touching target.
- Active: gather information WITH touching target.

Passive Recon Tools:
- [host]: IP addresses 
- [nslookup]: DNS information
- [traceroute]: Displaying possible routes
- [dnsrecon]: Pssive mode, <dnsrecon -d site.com>
- [wafw00f]: WAF information
- [dig]: DNS information ANY/MX/TXT
- [whois]: Domain information
- [DNSenum]: DNS information
- [whatweb]: Website technology
- [theHarvester]: OSINT platform <theHarvester -d site.com -b all>
- [sublist3r]: Subdomain enumeration
- [subfinder] : Subdomain enumeration

Passive Recon Online Tools:
- [netcraft]: Some usefull information <https://sitereport.netcraft.com/>
- [dnsdumpster]: DNS map information <https://dnsdumpster.com>
- [dnsleaktest]: DNS leak information <https://dnsleaktest.com/>
- [Wappalyzer]: Website technology <https://addons.mozilla.org/en-US/firefox/addon/wappalyzer/>
- [BuiltWith]: Website technology <https://addons.mozilla.org/fi/firefox/addon/builtwith/>
- [google]: Subdomain enumeration <https://www.google.com/> [site:*.bbc.com -site:www.bbc.com]
- [archive]: Website History <https://archive.org/>
- [ip2location]: Geo location <https://www.ip2location.com>
- [alerts]: Set google change alert on target <https://www.google.com/alerts>
- [shodan]: Shodan <https://www.shodan.io/dashboard>


Active Recon Tools:
- [fping]: Ping Sweep 
- [ping]: IP addresses
- [dnsrecon]: Active mode zone transfer, <dnsrecon -d site.com -t axfr>
- [fierce] : Active Subdomain enumeration brute force
- [knockpy] : Active Subdomain enumeration brute force
- [nmap]: Port Scanning
- [nikto]: Vulnerability scanning <nikto -h site.com>
- [dirb]: Directory brute force
- [dirbuster]: Directory brute force
- [gobuster]: Directory brute force
- [wfuzz]: Finding and exploiting web application vulnerabilities
- [wpscan]: Wordpress CMS scan. <wpscan --url https://site.com --wp-content-dir -at -eu>


Automated Reconnaissance Framework
- Sn1per
- amass
- recon-ng
- maltego
- centralops <https://centralops.net>

[//]: # (References)
[mitre]: <https://attack.mitre.org/>
[hackertarget]: <https://hackertarget.com/whatweb-scan/>
