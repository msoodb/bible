[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)


## Exploit-DB in Linux/Fedora
```sh
sudo snap install searchsploit
```

- command
```sh
searchsploit joomla
searchsploit joomla -w
searchsploit joomla --exclude="plugin"
searchsploit joomla | grep facebook
searchsploit metasploit joomla
searchsploit 38797
searchsploit -p 38797
searchsploit 38797 --examine
```

- Examining nmap result
```sh
nmap -sV scanme.nmap.org -oX nmap.xml
searchsploit --nmap nmap.xml
```
