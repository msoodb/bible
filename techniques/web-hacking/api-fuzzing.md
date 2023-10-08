
# REST API Endpoint Fuzzing
```sh
ffuf -u https://api.particlehealth.com/FUZZ -w /usr/share/wordlists/seclists/Discovery/Web-Content/api/objects.txt -mc 400
```
mc: 200,201,400,401,403,...
