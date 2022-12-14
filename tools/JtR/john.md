[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

# JtR
John the Ripper (JtR) is a popular password-cracking tool. John supports many encryption technologies for Windows and Unix systems (Mac included).

[https://www.openwall.com/john/]
[https://www.openwall.com/john/k/john-1.9.0-jumbo-1.tar.gz]

<hr/>

## install JtR in Linux
```sh
cd /opt
sudo wget https://www.openwall.com/john/k/john-1.9.0-jumbo-1.tar.gz
sudo tar -xvzf john-1.9.0-jumbo-1.tar.gz
sudo mv john-1.9.0-jumbo-1 john
cd john/src
sudo ./configure
run/john
```

## install JtR in Linux using snapd
```sh
sudo snap install john-the-ripper
```

## JtR mode
- Single crack mode
- Wordlist mode
- Incremental mode

1- Single Crack Mode
In single-crack mode, John takes a string and generates variations of that string in order to generate a set of passwords.
```sh
```

2- Dictionary/Wordlist Mode
```sh
john --wordlist=dictionary.txt --format=raw-md5 hash.txt
```
> The first time you run the latter, it will show the password on the screen, after which point, it will save it into a file called john.pot. In my case, the folder john.pot was located at [~/.john/john.pot] or [~/snap/john-the-ripper/current/.john]

```sh
john --show --format=Raw-MD5 hash.txt
```

```sh
zip2john linuxhint.zip > linuxhint_password.txt
```
> Here, what we did was crack a zip file, but it doesn’t have to be a zip file! It can be almost anything. Just remember that you have to, in such cases, use the {your_module}2john. For example, if you were cracking Wifi, you’d use Aircrack-ng and obtain a cap file. Once you’ve obtained the cap file, you’d have to convert the cap file to an hccap file. Once you have a hccap file, use the hccap2john to convert it to the john format, which will yield results on John the Ripper.

3- Incremental Mode
```sh
```

## Use cases
- Crack a Windows Password
- Crack a Linux Password
- Crack a Zip File Password