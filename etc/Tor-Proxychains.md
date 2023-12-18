
# tor
sudo dnf upgrade --refresh
sudo dnf install torbrowser-launcher

# proxychains
sudo dnf install proxychains-ng
vim /etc/proxychains.conf
    Remove Dynamic chain from comment
    comment Strict chain and Random chain
    Remove proxy DNS from comment
    write socks5 127.0.0.1 9050 in last line of proxy list 
sudo systemctl restart tor

# check
    proxychains curl google.com
    curl ifconfig.me/ip
    proxychains curl ifconfig.me/ip

    proxychains firefox
    https://www.dnsleaktest.com/

