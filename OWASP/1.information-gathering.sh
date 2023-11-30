
# --------------------------------
#
# Information Gathering
#
# --------------------------------


# --------------------------------
# OTG-INFO-001
# --------------------------------
1. "Conduct search engine discovery/reconnaissance for information leakage"

# Use all tools search engine to search for:
• Network diagrams and configurations# Test Objectives
• Archived posts and emails by administrators and other key staff
• Log on procedures and username formats
• Usernames and passwords
• Error message content
• Development, test, UAT and staging versions of the website

# Tools
• https://www.exploit-db.com/google-hacking-database              # google dork
• https://sitereport.netcraft.com/?url=https://www.example.com    # netcraft
• https://hackertarget.com/reverse-ip-lookup/                     # reverse ip lookup
• https://web.archive.org/                                        # wayback machine
• https://search.censys.io/         # servers, more
• https://zoomeye.org               # servers
• https://www.shodan.io/            # servers
• https://pastebin.com              # leaked password
• https://rocketreach.co            # users, emails
• https://haveibeenpwned.com/       # password reuse attack
• Baidu
• binsearch.info
• Bing
• Duck Duck Go
• ixquick/Startpage
• Google                    # site:example.com, filetype:pdf, inurl:login, cache:example.com
• PunkSpider


# --------------------------------
# OTG-INFO-002
# --------------------------------
2. "Fingerprint Web Server"

# Tools
• https://net-square.com/httprint.html
• https://www.netcraft.com/
• https://www.wappalyzer.com


# --------------------------------
# OTG-INFO-003
# --------------------------------
3. "Review Webserver Metafiles for Information Leakage"

# Tools
• wget .../robots.txt
• curl .../robots.txt
• rockspider.pl -www www.example.com
• Burpsuite <META> Tags
• Browser (View Source function)


# --------------------------------
# OTG-INFO-004
# --------------------------------
4. "Enumerate Applications on Webserver"

# Test Objectives
• Enumerate the applications within scope that exist on a web server
    1. Different base URL       URLs wayback, dir fuzzing
    2. Non-standard ports       nmap
    3. Virtual hosts            IP reverse lookup


# --------------------------------
# OTG-INFO-005
# --------------------------------
5. "Review webpage comments and metadata for information leakage"

# Test Objectives
• Review webpage comments and metadata to better understand the application and to find any information leakage.
    1. Comments
    2. Meta tag

# Tools
• Wget
• Browser “view source” function
• Eyeballs
• Curl


# --------------------------------
# OTG-INFO-006
# --------------------------------
6. "Identify application entry points"

# Test Objectives
• Understand how requests are formed and typical responses from the application.

# Tools
• OWASP: Zed Attack Proxy (ZAP)
• OWASP: WebScarab
• Burp Suite
• CAT
• Browser Plug-in
    • TamperIE for Internet Explorer
    • Tamper Data for Firefox

# --------------------------------
# OTG-INFO-007
# --------------------------------
7. "Map execution paths through application"

# Test Objectives
• Map the target application and understand the principal workflows.
    • Path
    • Data
    • Race

# Tools
• Zed Attack Proxy (ZAP)
• Burp Suite
• URL fuzzing
• Diagramming software


# --------------------------------
# OTG-INFO-008
# --------------------------------
8. "Fingerprint Web Application Framework"

# Test Objectives
• To define type of used web framework so as to have a better understanding of the security testing methodology.
    • Web Application Frameworks - WAF 
    • Content Management Systems - CMS

# How
• HTTP headers                      
    - X-Powered-By: Mono
    - X-Generator: Swiftlet
• Cookies
    - CAKEPHP=rm72kprivgmau5fmjdesbuqi71
• HTML source code
• Specific files and folders

# Tools
• WhatWeb               # https://morningstarsecurity.com/research/whatweb
• BlindElephant.py
• Wappalyzer


# --------------------------------
# OTG-INFO-009
# --------------------------------
9. "Fingerprint Web Application"

# Test Objectives
• Identify the web application and version to determine known vulnerabilities and the appropriate exploits to use during testing.
    • Cookies               
    • HTML source code              # <meta name=”generator” content=”WordPress 3.9.2” />
    • Specific files and folders
        - WordPress-specific folders

# Tools
• WhatWeb               # https://morningstarsecurity.com/research/whatweb
• BlindElephant.py
• Wappalyzer


# --------------------------------
# OTG-INFO-010
# --------------------------------
10. "Map Application Architecture"

# Tools
• WAFW00F
• Nmap
