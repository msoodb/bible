# subdomain takeovers

```sh
$ host subdomain.example.com
subdomain.example.com has address 192.30.252.153
subdomain.example.com has address 192.30.252.154
$ whois 192.30.252.153 | grep "Org-naame | orgName"
OrgName: GitHub, Inc.
```