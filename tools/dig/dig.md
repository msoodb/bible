
# Example

- dig <domain-name>
- dig <domain-name> -t mx
- dig <domain-name> -t ns +short
- dig @8.8.8.8 +trace <domain-name>
- dig -x <ip>   
- dig +noall +answer +multiline <domain-name> any 


# Practical
dig <domain-name> -t ns
dig @<ns1....> -tAXFR <domain-name>
dig @<ns2....> -tAXFR <domain-name>