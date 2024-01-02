
# 1-Reconnaissance

# Passive Reconnaissance Tools, Gather information WITHOUT touching target.
- [Company]
     - [Name]
     - [Locations]
     - [Services]
     - [Processes]
     - [Contacts]
     - [KeyPersons]
     - [Partners]
     - [Payment]
     - [Website]
- [Leaked-info]
     - [Baidu]
     - [binsearch.info]
     - [Bing]
     - [DuckDuckGo]
     - [ixquick/Startpage]
     - [Google]                                             site:example.com filetype:pdf inurl:login cache:example.com
     - [PunkSpider]
     - [Framework]       OSINT Framework                    https://osintframework.com
     - [theHarvester]    OSINT platform                     -
     - [rocketreach]     Email and phone                    https://rocketreach.co
     - [GHDB]            Google Hacking Database            https://www.exploit-db.com/google-hacking-database
     - [alerts]          Set google change alert            https://google.com/alerts
     - [shodan]          Shodan                             https://shodan.io/dashboard
     - [SocialMedia]     Linkedin, Instagram, facebook      https://instagram.com/
     - [censys.io]       censys.io                          https://search.censys.io/
     - [zoomeye.org]     zoomeye.org                        https://www.zoomeye.org
     - [github.com]      Code and data leak                 https://github.com
     - [pastebin]        leaked password                    https://pastebin.com
     - [haveibeenpwned]  password reuse attack              https://haveibeenpwned.com
- [Infrastructure]
     - [Technology]
     - [Network]
     - [Firewall]
          - [IPS]
          - [Firewall]
          - [WAF]
     - [Cloud]
          - [IaaS]
          - [CaaS]
          - [PaaS]
          - [FaaS]
          - [SaaS]
          - [Storage]
- [Applications]
     - [Web-servers]
     - [Mail-server]
     - [CRM]
     - [HR]
     - [ERP]
     - [E-Learning]
     - [User-Directory]
- [Scopes]
     - [Wildcards]
     - [Mobile-apps]
     - [Domains]
     - [CIDR]
     - [Out-of-Scope]
- [DNS]
     - [host]            IP addresses                       -
     - [whois]           Domain information                 -
     - [dig]             DNS information ANY/MX/TXT         dig +trace example.com
     - [ip2location]     Geo location                       https://ip2location.com
     - [reverse-ip]      Find all websites on the ip        https://hackertarget.com/reverse-ip-lookup/
     - [traceroute]      Displaying possible routes         -     
     - [nslookup]        DNS information                    -
     - [dnsrecon]        DNS Passive/Active mode            -
     - [dnsdumpster]     DNS map information                https://dnsdumpster.com
     - [dnsleaktest]     DNS leak information               https://dnsleaktest.com
     - [DNSenum]         DNS information                    -
     - [wafw00f]         WAF information                    -
     - [p0f]             TCP/IP stack fingerprinting        -
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
     - [waybackurl]      URL enumeration                    -
     - [katana]          Host enumeration                   -
- [Webapp]     
     - [archive]         Website History                    https://archive.org/web     
     - [netcraft]        Some usefull information           https://sitereport.netcraft.com
     - [Wappalyzer]      Website technology                 addons.mozilla.org
     - [BuiltWith]       Website technology                 addons.mozilla.org/
     - [hackertarget]    WhatWeb & Wappalyzer Scan          https://hackertarget.com
     - [whatweb]         Website technology                 -
     - [Firefox]         Browser, Source Code Review        -
     - [BurpSuite]       Set Scope, Browser and Log         -
     - [securityheaders] Headers missing                    https://securityheaders.com
     - [weleakinfo.io]   Info                               https://weleakinfo.io/
     - [hunter.io]       Info                               https://hunter.io/
     - [Original-ip]     Find the real IP of websites       https://securitytrails.com, https://zoomeye.org
- [Target]
     - [domain]          Selected domain to be scanned in next phase
     - [subdomain]       Selected subdomain to be scanned in next phase
     - [ip]              Selected ip to be scanned in next phase
     - [url]             Selected url to be scanned in next phase     
     - [api]             Selected api to be scanned in next phase

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