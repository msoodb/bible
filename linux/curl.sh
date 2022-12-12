#!/bin/bash


curl --version

# -------------------------------------------  common usecase with cURL
# Save the Output to a File
curl -O vue-v2.6.10.js https://cdn.jsdelivr.net/npm/vue/dist/vue.js

# Resume a Download
curl -C - -O https://releases.ubuntu.com/20.04.1/ubuntu-20.04.1-desktop-amd64.iso

# Download Multiple files
curl -O http://mirrors.edge.kernel.org/archlinux/iso/2018.06.01/archlinux-2018.06.01-x86_64.iso  \
     -O https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.4.0-amd64-netinst.iso

# Get the HTTP Headers of a URL
curl -I --http2 https://ubuntu.com/
curl -I --http2 https://www.ubuntu.com/

# Follow Redirects
curl -L google.com

# Change the User-Agent
curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0" https://getfedora.org/

# Specify a Maximum Transfer Rate
curl --limit-rate 10k -O https://releases.ubuntu.com/20.04.1/ubuntu-20.04.1-desktop-amd64.iso

# Transfer Files via FTP
curl -u anonymous: ftp://ftp.maangrui.xyz/pub/open_vpn_client/samoor.ovpn
curl -T newfile.tar.gz -u FTP_USERNAME:FTP_PASSWORD ftp://ftp.example.com/

# Send Cookies
curl -L -b "oraclelicense=a" -O http://download.oracle.com/otn-pub/java/jdk/10.0.2+13/19aef61b38124481863b1413dce1855f/jdk-10.0.2_linux-x64_bin.rpm

# Using Proxies
curl -x 192.168.44.1:8888 http://linux.com/
curl -U username:password -x 192.168.44.1:8888 http://linux.com/


# -------------------------------------------  Rest API with cURL
# GET
curl --location --request GET "https://reqres.in/api/users?page=2" \
     --header "apikey: 571dff6b-4170-4fc3-9422-9c1b82aa6e37" \
     --header "Accept: application/json , version=2.2.2" 

curl --location --request GET "https://reqres.in/api/users/2" \
     --header "apikey: 571dff6b-4170-4fc3-9422-9c1b82aa6e37" \
     --header "Accept: application/json , version=2.2.2" 


# POST
curl --location --request POST "https://reqres.in/api/users" \
     --header "apikey: 571dff6b-4170-4fc3-9422-9c1b82aa6e37" \
     --header "Accept: application/json , version=2.2.2" \
     --data '{
        "name": "morpheus",                   
        "job": "leader"                       
        }'

curl --location --request POST "https://reqres.in/api/users" \
     --header "apikey: 571dff6b-4170-4fc3-9422-9c1b82aa6e37" \
     --header "Accept: application/json , version=2.2.2" \
     --data @body.json

curl --location --request POST "https://reqres.in/api/users" \
     --data '{
         "email": "eve.holt@reqres.in",
    	 "password": "cityslicka"
	 }'

# PUT
curl --location --request PUT "https://reqres.in/api/users/2" \
     --header "apikey: 571dff6b-4170-4fc3-9422-9c1b82aa6e37" \
     --header "Accept: application/json , version=2.2.2" \
     --data @body.json

# DELETE
curl --location --request DELETE "https://reqres.in/api/users/2" \

RUN_ME=0


# -Basic Authentication : Atlassian
RUN_ME=0
if [ $RUN_ME = 1 ]
then
    BASE_URL="https://saashop.atlassian.net/rest/api"
    API_VERSION="/2"
    USER=""
    API_TOKEN=""
    BASIC_AUTH=$(echo -n $USER:$API_TOKEN | base64 -w 0)

    # header 
    curl --location --request GET --verbose \
	 --url "$BASE_URL/$API_VERSION/issue/SA-64" \
     	 --header "Authorization: Basic $BASIC_AUTH" \
	 --header "Content-Type: application/json" | json_reformat
    # --user "$USER:$API_TOKEN"
fi

# -Bearer Authentication : PayPal
RUN_ME=0
if [ $RUN_ME = 1 ]
then
    BASE_URL="https://api-m.sandbox.paypal.com"
    CLIENT_ID=''
    SECRET=''
    BASIC_AUTH=$(echo -ne $CLIENT_ID:$SECRET | base64 -w 0)

    # get access token via basic authentication
    curl --location --request POST --verbose \
	 --url "$BASE_URL/v1/oauth2/token" \
    	 --header "Accept: application/json" \
    	 --header "Accept-Language: en_US" \
    	 --header "Authorization: Basic $BASIC_AUTH" \
    	 --data "grant_type=client_credentials"
    # --user "$CLIENT_ID:$SECRET"
    ACCESS_TOKEN=""

    # use access token via bearer authentication
    curl --location --request POST --verbose \
	 --url "$BASE_URL/v2/invoicing/generate-next-invoice-number" \
	 --header "Content-Type: application/json" \
	 --header "Authorization: Bearer $ACCESS_TOKEN"
fi


# -API Key : weatherapi, skyscanner
RUN_ME=0
if [ $RUN_ME = 1 ]
then
    BASEAPI_URL="https://api.weatherapi.com/v1"
    API_KEY=""

    curl --location --request GET --verbose \
	 --url "$BASEAPI_URL/current.json?key=$API_KEY&q=London" 
fi

RUN_ME=1
if [ $RUN_ME = 1 ]
then
    BASEAPI_URL="https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices"
    API_HOST=""
    API_KEY=""

   curl --request GET \
	--url "$BASEAPI_URL/browsequotes/v1.0/US/USD/en-US/SFO-sky/JFK-sky/2020-12-15?inboundpartialdate=2020-12-01" \
	--header "x-rapidapi-host: $API_HOST" \
	--header "x-rapidapi-key: $API_KEY"
fi

# OAuth 2.0 Authentication : Google


# https://www.weatherapi.com signup/in to get
# api key for calling and testing api.
# docs https://www.weatherapi.com/docs/



# Setup
RUN_ME=0

# LIVE environment Create API key
BASEAPI_URL="https://api.weatherapi.com/v1"
API_KEY="eeb797a976d94ddf8d394228201111"

# Current
RUN_ME=1
if [ $RUN_ME = 1 ]
then
    #curl --location --request GET --verbose "$BASEAPI_URL/current.json?key=$API_KEY&q=Espoo"
    curl --location --request GET --verbose "$BASEAPI_URL/current.json" \
    -G -d "key=$API_KEY" \
    -d "q=Espoo"
fi


# Forecast
RUN_ME=0
if [ $RUN_ME = 1 ]
then
    curl --location --request GET --verbose "$BASEAPI_URL/forecast.json?key=$API_KEY&q=London&days=7"
fi


# Search
RUN_ME=0
if [ $RUN_ME = 1 ]
then
    curl --location --request GET --verbose "$BASEAPI_URL/search.json?key=$API_KEY&q=Lond"
fi

