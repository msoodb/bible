
# 1-Reconnaissance

INPUT
- target
     - core application
     - wildcards
- Information About Target
PROCESS
- Gather Information
TOOLS
- Passive Reconnaissance Tools  
- Active Reconnaissance Tools 
- Automated Reconnaissance Framework 
- Vulnerability Repositories
OUPUT
- domain
- host
- url
- network map
     - IPs
     - Ports
     - Services
     - Firewalls
     - Users
- potential vulnerability


# Passive Reconnaissance Tools, Gather information WITHOUT touching target.
- [Company]         
     - [Name]
     - [Location]
     - [Contacts]
     - [KeyPerson]
     - [whebsite]     
- [Website]
     - [Firefox]         Browser, Source Code Review        -
     - [host]            IP addresses                       -
     - [whois]           Domain information                 -
     - [ip2location]     Geo location                       https://www.ip2location.com
     - [traceroute]      Displaying possible routes         -
     - [archive]         Website History                    https://archive.org/web     
     - [netcraft]        Some usefull information           https://sitereport.netcraft.com
     - [Wappalyzer]      Website technology                 https://addons.mozilla.org/en-US/firefox/addon/wappalyzer
     - [BuiltWith]       Website technology                 https://addons.mozilla.org/fi/firefox/addon/builtwith
     - [hackertarget]    WhatWeb & Wappalyzer Scan          https://hackertarget.com/whatweb-scan
     - [whatweb]         Website technology                 -
     - [wafw00f]         WAF information                    -
     - [p0f]             TCP/IP stack fingerprinting        -
- [DNS]
     - [dig]             DNS information ANY/MX/TXT         -
     - [nslookup]        DNS information                    -
     - [dnsrecon]        DNS Passive/Active mode            -
     - [dnsdumpster]     DNS map information                https://dnsdumpster.com
     - [dnsleaktest]     DNS leak information               https://dnsleaktest.com     
     - [DNSenum]         DNS information                    -
- [Domain]
     - [crtsh]           Subdomain enumeration              -
     - [subfinder]       Subdomain enumeration              -
     - [assetfinder]     Subdomain enumeration              -
     - [subbrute]        Subdomain enumeration              -
     - [amass]           Subdomain enumeration              -
     - [ffuf]            Subdomain enumeration              -
- [Host]
     - [httprobe]        Host enumeration                   -
     - [httpx]           Host enumeration                   -
     - [fff]             Host enumeration                   -
- [URL]
     - [waybackurl]      URL enumeration                   -
     - [katana]          Host enumeration                   -
- [OSINT]
     - [Framework]       OSINT Framework                    https://osintframework.com
     - [theHarvester]    OSINT platform                     -
     - [google]          Subdomain enumeration              https://www.google.com/> [site:*.bbc.com -site:www.bbc.com]
     - [GHDB]            Google Hacking Database            https://www.exploit-db.com/google-hacking-database
     - [alerts]          Set google change alert            https://www.google.com/alerts
     - [shodan]          Shodan                             https://www.shodan.io/dashboard
     - [SocialMedia]     Linkedin, Instagram, facebook      https://www.instagram.com/


# Active Reconnaissance Tools, Gather information WITH touching target.
- [Domain]
     - [fierce]          Active Subdomain enum brute-force   
     - [knockpy]         Active Subdomain enum brute-force
- [Network]
     - [fping]           Ping Sweep                          
     - [ping]            IP addresses                             
     - [nmap]            Find Ports and Services            nmap script
     - [rustscan]        Fast Port Scan

# Automated Reconnaissance Framework, and Vulnerability Repositories
- [recon-ng]                https://www.kali.org/tools/recon-ng
- [maltego]                 https://www.maltego.com
- [Sn1per]                  https://github.com/1N3/Sn1per
- [amass]                   https://github.com/OWASP/Amass
- [centralops]              https://centralops.net
- [Nessus]                  https://www.tenable.com
- [Nexpose]                 https://www.rapid7.com/products/nexpose
- [OpenVAS]                 https://www.openvas.org
- [ExploitDB]               https://www.exploit-db.com
- [NVD]                     https://nvd.nist.gov/vuln/search
- [Mitre]                   https://www.cve.org
- [OVAL]                    https://oval.cisecurity.org/repository
- [rapid7]                  https://www.rapid7.com/db/
- [favicon]                 https://wiki.owasp.org/index.php/OWASP_favicon_database
- [dencode]                 https://dencode.com
