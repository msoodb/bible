## Title
> Data leakage via background.png

## Description
> In the home page source, background loaded from "background.png" which instead of iamge, contains Flag0 data.

## Reproduction Steps
1. Go to home 
2. In the Firefox > More tools > Web developer tools > Network
3. Reload home page
4. Get Flag in "Get /background.png"
