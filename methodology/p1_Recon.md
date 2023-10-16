
# 1-Reconnaissance

INPUT
- target
     - core application
     - wildcards
     - target ip
     - info
PROCESS
- Target Validation
- Subdomains
- Fingerprinting
- Data breach
TOOLS
- Reconnaissance Tools 
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
     - [host]            IP addresses                       -
     - [whois]           Domain information                 -
     - [ip2location]     Geo location                       ip2location.com
     - [traceroute]      Displaying possible routes         -
     - [archive]         Website History                    archive.org/web     
     - [netcraft]        Some usefull information           sitereport.netcraft.com
     - [Wappalyzer]      Website technology                 addons.mozilla.org
     - [BuiltWith]       Website technology                 addons.mozilla.org/
     - [hackertarget]    WhatWeb & Wappalyzer Scan          hackertarget.com
     - [whatweb]         Website technology                 -
     - [wafw00f]         WAF information                    -
     - [p0f]             TCP/IP stack fingerprinting        -
     - [Firefox]         Browser, Source Code Review        -
     - [BurpSuite]       Set Scope, Browser and Log         -
     - [securityheaders] Headers missing                    securityheaders.com
     - [weleakinfo.io]   Info                               weleakinfo.io/
     - [hunter.io]       Info                               hunter.io/
- [DNS]
     - [dig]             DNS information ANY/MX/TXT         -
     - [nslookup]        DNS information                    -
     - [dnsrecon]        DNS Passive/Active mode            -
     - [dnsdumpster]     DNS map information                dnsdumpster.com
     - [dnsleaktest]     DNS leak information               dnsleaktest.com
     - [DNSenum]         DNS information                    -
- [Subdomain]
     - [crtsh]           Subdomain enumeration              https://crt.sh/
     - [subfinder]       Subdomain enumeration              -
     - [assetfinder]     Subdomain enumeration              -
     - [subbrute]        Subdomain enumeration              -
     - [amass]           Subdomain enumeration              -
     - [ffuf]            Subdomain enumeration              -
     - [google]          [site:*.bbc.com -site:www.bbc.com]
- [Host]
     - [httprobe]        Host enumeration                   -
     - [httpx]           Host enumeration                   -
     - [fff]             Host enumeration                   -
- [URL]
     - [waybackurl]      URL enumeration                   -
     - [katana]          Host enumeration                   -
- [OSINT]     
     - [Framework]       OSINT Framework                    osintframework.com
     - [theHarvester]    OSINT platform                     -
     - [rocketreach]     Email and phone                    rocketreach.co
     - [GHDB]            Google Hacking Database            exploit-db.com
     - [alerts]          Set google change alert            google.com/alerts
     - [shodan]          Shodan                             shodan.io/dashboard
     - [SocialMedia]     Linkedin, Instagram, facebook      instagram.com/


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
