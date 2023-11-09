
# IDOR
Insecure direct object references

## How IDOR attacks can occurs:
IDOR attacks occur when an attacker can directly reference a sensitive object without any Authentication/Authorization. 
In ecommerce websites, this can occur when a page or URL includes a reference to private data, 
but does not properly check the user’s Authentication/Authorization to access that data.


# Examples
- https://insecure-website.com/customer_account?customer_number=132355
- https://insecure-website.com/static/12144.txt

- http://foo.bar/somepage?invoice=12345
- http://foo.bar/changepassword?user=someuser
- http://foo.bar/showImage?img=img00011
- http://foo.bar/accessPage?menuitem=12


# Find Potential urls
    cat urls | grep -E "\?.+\="
    cat urls | grep -E "[0-9]"
