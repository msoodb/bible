## Title
> Stored XSS with nothing decoded into post comment textarea.

## Severity
> High

## Description
> User insert some script into comment textarea in post page. 
This Stored XSS code runs everytime post page viewed by other user.

## Reproduction Steps
1. Go to home page.
2. Click "View post" for some random post.
3. Go to "Leave a comment" section.
4. Fill comment
    - Comment: <script>alert(1)</script>.
    - Name: anything
    - Email: any valid email
5. Post comment.

## Impact
> Attacker cand steal sensitive data from victim.

## PoC Code
```
<script>alert(1)</script>
```
