
https://web.dev/same-site-same-origin/


Origin
> scheme://hostname:port 

Example
> URL         https://www.example.com:443/foo \
> Origin      https://www.example.com:443


same-origin vs cross-origin
> Websites that have equal Origin are considered "same-origin". Everything else is considered "cross-origin".

Example
- https://www.example.com:443       https://www.evil.com:443        cross-origin: different domains
                                    https://example.com:443         cross-origin: different subdomains
                                    http://www.example.com:443      cross-origin: different schemes
                                    https://www.example.com:80	    cross-origin: different ports
                                    https://www.example.com:443	    same-origin: exact match
                                    https://www.example.com	        same-origin: implicit port number (443) matches


Site
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
- https://www.example.com:443       https://www.evil.com:443	        cross-site: different domains
                                    https://login.example.com:443	    same-site: different subdomains don't matter
                                    http://www.example.com:443	        cross-site: different schemes
                                    https://www.example.com:80	        same-site: different ports don't matter
                                    https://www.example.com:443	        same-site: exact match
                                    https://www.example.com	            same-site: ports don't matter
