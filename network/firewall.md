
# Firewall
A firewall is software or hardware that monitors the network traffic and compares it against a set of rules before passing or blocking it.

# Ports ans services
- 23 telnet
- ...

# Firewall layer
- Layer 3               Can work on IP address
- Layer 4               Can Work on Port
- Layer 5,6,7

# Firewall inspection abilities
- Packet-Filtering Firewall                 Basic type of firewall
- Circuit-Level Gateway                     Additional capabilities, checking TCP three-way-handshake against the firewall rules 
- Proxy Firewall                            AF, WAF
- Next-Generation Firewall - NGFW           Highest firewall protection

# Scanning a host behind a firewall
Nmap stealth (SYN) scan                             -sS -Pn -F MACHINE_IP
Hide a scan with decoys 	                        -D DECOY1_IP1,DECOY_IP2,ME
Hide a scan with random decoys 	                    -D RND,RND,ME
Use an HTTP/SOCKS4 proxy to relay connections 	    --proxies PROXY_URL
Spoof source MAC address 	                        --spoof-mac MAC_ADDRESS
Spoof source IP address 	                        -S IP_ADDRESS
Use a specific source port number 	                -g PORT_NUM or --source-port PORT_NUM

# Evasion via Forcing Fragmentation, MTU, and Data Length
Fragment IP data into 8 bytes 	-f
Fragment IP data into 16 bytes 	-ff
Fragment packets with given MTU 	--mtu VALUE
Specify packet length 	--data-length NUM

# Evasion Using Port Hopping
nc -vlnp <port>
ncat <ip> <port>

# Evasion Using Port Tunneling
ncat -lvnp 443 -c "ncat TARGET_SERVER 25"
ncat -lvnp 8008 -c "ncat 10.10.56.112 80" 

# Evasion Using Non-Standard Ports 