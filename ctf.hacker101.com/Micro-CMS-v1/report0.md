
## Title
> Flag

## Description
> In the "edit" page, Title has XSS vulnerability.

## Reproduction Steps
1. Go to home 
2. Click on arbitary post, leads you to /page/<id>
3. Click "Edit this page"
4. In the Title input, type <script>alert('xss')</script>
5. Click "save" button. wait untill save complete.
6. Click "Go home"
7. Flag has shown in pop-up window.
