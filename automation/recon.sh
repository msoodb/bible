#!/bin/bash

#####################################################################
# Reconnaissance
#   - <company>
#####################################################################

<<comment
- [Company]
     - [Name]
     - [Locations]
     - [CoreBussines]
     - [Processes]
     - [Contacts]
     - [KeyPersons]
     - [Partners]
     - [Informations]    
          - [Search-Engin]
          - [OSINT]
     - [Website]
- [Search-Engin]     
     - [Baidu]
     - [binsearch.info]
     - [Bing]
     - [DuckDuckGo]
     - [ixquick/Startpage]
     - [Google]          
          - site:example.com
          - filetype:pdf
          - inurl:login, cache:example.com
     - [PunkSpider]
- [OSINT]     
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
comment

# ----------------------------------
#   ~/Operations/<company>/       
# ----------------------------------
init ()
{    
    touch company

    # OTG-INFO-001
    # Conduct search engine discovery/reconnaissance for information leakage

<<comment
     Test Objectives
     To understand what sensitive design and configuration information of
     the application/system/organization is exposed both directly (on the
     organization’s website) or indirectly (on a third party website).
comment

}
