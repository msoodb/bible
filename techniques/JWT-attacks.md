
# JWT format

A JWT consists of 3 parts: 
1. header       
    - base64url-encoded JSON objects
    - contains metadata about the token itself
2. payload
    - base64url-encoded JSON objects
    - contains the actual "claims" about the user
3. signature
    - The server that issues the token typically generates the signature by hashing the header and payload. 
    - In some cases, they also encrypt the resulting hash
    - Directly derived from the rest of the token, changing a single byte of the header or payload results in a mismatched signature.
    - Without knowing the server's secret signing key, it shouldn't be possible to generate the correct signature for a given header or payload.

These are each separated by a dot, as shown in the following example:
> eyJraWQiOiI5MTM2ZGRiMy1jYjBhLTRhMTktYTA3ZS1lYWRmNWE0NGM4YjUiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJwb3J0c3dpZ2dlciIsImV4cCI6MTY0ODAzNzE2NCwibmFtZSI6IkNhcmxvcyBNb250b3lhIiwic3ViIjoiY2FybG9zIiwicm9sZSI6ImJsb2dfYXV0aG9yIiwiZW1haWwiOiJjYXJsb3NAY2FybG9zLW1vbnRveWEubmV0IiwiaWF0IjoxNTE2MjM5MDIyfQ.SYZBPIBg2CRjXAJ8vCER0LA_ENjII1JakvNQoP-Hw6GG1zfl4JyngsZReIfqRvIAEi5L4HV0q7_9qGhQZvy9ZdxEJbwTxRs_6Lb-fZTDpW6lKYNdMyjw45_alSCZ1fypsMWz_2mTpQzil0lOtps5Ei_z7mM7M8gCwe_AGpI53JxduQOaB5HkT5gVrv9cKu9CsW5MS6ZbqYXpGyOG5ehoxqm8DL5tFYaW3lB50ELxi0KsuTKEbD0t5BCl0aCR2MBJWAbN-xeLwEenaqBiwPVvKixYleeDQiBEIylFdNNIMviKRgXiYuAvMziVPbwSgkZVHeEdF5MQP1Oe2Spac-6If


## JWT attacks
> JWT attacks involve a user sending modified JWTs to the server in order to achieve a malicious goal. \
Typically, this goal is to bypass authentication and access controls by impersonating another user who has already been authenticated. 

1. JWT authentication bypass via unverified signature