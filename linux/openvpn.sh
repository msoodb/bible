#!/bin/bash


# vpn server: openvpn
sudo dnf install openvpn
mkdir -p ~/bin/vpn
cd ~/bin/vpn
curl -O  https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
chmod +x openvpn-install.sh
sudo ./openvpn-install.sh

# transfer file
scp -P 33000 -i ~/.ssh/id_rsa_personal -r samoor@135.181.248.115:~/ovpn_clients/samoor.ovpn .

# vpn client: openvpn
sudo dnf install openvpn
sudo cp samoor.ovpn /etc/openvpn/client/samoor.ovpn
sudo openvpn /etc/openvpn/client/samoor.ovpn
