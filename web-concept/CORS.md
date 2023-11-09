

Refs
- https://web.dev/same-site-same-origin/
- https://supertokens.com/blog/what-is-cross-origin-resource-sharing
- https://tomgregory.com/cors-guide/


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



3. Same Origin Policy

Most websites make cross-origin requests. Why?
- it’s convenient to store assets like JavaScript, images, and CSS on a different server
- it’s clearer to host different parts of a website on different subdomains e.g. https://apis.google.com:443
- JavaScript code may need to make API calls to other 3rd party services

OK, so websites need to make requests to different origins. So what? Browser default behaviour:
- Browsers by default allow cross-origin requests from:
    - Image <img src="..."> tags
    - CSS <link rel="..."> tags
    - JavaScript <script src="..."> tags
    - some other resources
- But, browsers by default deny cross-origin requests from:
    - JavaScript code using the fetch API or XMLHttpRequest
    - some other resources

> This policy is known as the "same origin policy". Browsers implement it to prevent certain attacks, where malicious websites run JavaScript code requesting data from other websites. \
> The same-origin policy is an important security feature of any modern browser. Its purpose is to restrict cross-origin interactions between documents, scripts, or media files from one origin to a web page with a different origin.
> It is a common misconception that same-origin policy blocks all cross-origin resources. If that were true Content Delivery Networks (CDNs) wouldn't exist.

4. CORS
- CORS is a way for web servers to say “Accept cross-origin requests from this origin” or “Do not accept cross-origin requests from this origin”. 
- Cross-Origin Resource Sharing (CORS) is a relaxing of the same origin policy rules
- With CORS, and under certain conditions, browsers allow JavaScript code running on a site from one origin to send requests to another origin.
- With CORS, it’s up to the server to decide which cross-origin requests are allowed.

CORS preflight request
> More specifically, the preflight request is an OPTIONS request made to our API domain with a couple of headers

- Simple request
    - method is 
        - GET
        - POST
        - HEAD
    - Content-Type
        - text/plain
        - application/x-www-form-urlencoded 
        - multipart/form-data
- Preflight request


5. How does CORS actually work?

There are 2 main parts to it
- Browser: detects when JavaScript code tries to make a cross-origin request, intercepts that request before it’s sent, or before the response is returned
    - Simple requests: send the original request and validate CORS headers on the response
        - Access-Control-Allow-Origin: <origin>
            1. the response has an Access-Control-Allow-Origin header, and it contains the origin from which the cross-origin request was made. The browser accepts the response and the JavaScript code gets access to it.
            2. the response has an Access-Control-Allow-Origin header, but it doesn’t contain the origin from which the cross-origin request was made. The browser rejects the response, and the JavaScript code gets an error.
            3. the response doesn’t have an Access-Control-Allow-Origin header. The browser rejects the response, and the JavaScript code gets an error.
    - Pre-flighted requests: send a pre-flight request, validate it, then send the original request
        - OPTION Request
            1. Origin: as described above
            2. Access-Control-Request-Method
            3. Access-Control-Request-Headers
        - Response
            - Access-Control-Allow-Origin
            - Access-Control-Allow-Methods
            - Access-Control-Allow-Headers
        - The browser checks the pre-flight response to decide if the main request can be made. If it can, it makes it and passes the response to the JavaScript code. Otherwise, the browser doesn’t make the main request, and instead returns an error to the JavaScript code.
- Server: tells the browser which origins are allowed to make requests, by sending back special CORS HTTP headers

Do CORS requests include headers?
- Request headers
    - Accept
    - Accept-Language
    - Content-Language
    - Content-Type with a value of application/x-www-form-urlencoded, multipart/form-data, or text/plain
    - Access-Control-Allow-Headers: <header name 1>, <header name 2>,...
