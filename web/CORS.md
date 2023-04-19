

Refs
- https://web.dev/same-site-same-origin/
- https://supertokens.com/blog/what-is-cross-origin-resource-sharing


CORS
> CORS is a way for web servers to say “Accept cross-origin requests from this origin” or “Do not accept cross-origin requests from this origin”. \
> CORS is a protocol that defines the limitations of cross-origin requests.

CORS preflight request
> More specifically, the preflight request is an OPTIONS request made to our API domain with a couple of headers




1. Origin
> scheme://hostname:port 

Example
> URL         https://www.example.com:443/foo \
> Origin      https://www.example.com:443

same-origin vs cross-origin
> Websites that have equal Origin are considered "same-origin". Everything else is considered "cross-origin".

Example
```
- https://www.example.com:443       https://www.evil.com:443        cross-origin: different domains
                                    https://example.com:443         cross-origin: different subdomains
                                    http://www.example.com:443      cross-origin: different schemes
                                    https://www.example.com:80	    cross-origin: different ports
                                    https://www.example.com:443	    same-origin: exact match
                                    https://www.example.com	        same-origin: implicit port number (443) matches
```

2. Site
> scheme://TLD+1.TLD:port

Example
> URL            https://www.example.com:443/foo \
> Site           https://example.com

Example
> URL           https://www.project.github.io:443/foo
> Site          https://project.github.io

"same-site" and "cross-site"
> Websites that have equal site are considered "same-site". Everything else is considered "cross-site".

Example
```
- https://www.example.com:443       https://www.evil.com:443	        cross-site: different domains
                                    https://login.example.com:443	    same-site: different subdomains don't matter
                                    http://www.example.com:443	        cross-site: different schemes
                                    https://www.example.com:80	        same-site: different ports don't matter
                                    https://www.example.com:443	        same-site: exact match
                                    https://www.example.com	            same-site: ports don't matter
```
