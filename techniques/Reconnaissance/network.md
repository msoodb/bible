
# Discovering Network from the outside
- Check host is UP, ICMP
    - ping -c 1 199.66.11.4                             #1 echo request to a host
    - fping -g 199.66.11.0/24                           #Send echo requests to ranges
    - nmap -PEPM -sP -n 199.66.11.0/24                  #Send echo, timestamp requests and subnet mask requests
- Port Discovery
    - nmap
- Wifi
    - ip link show                                      #List available interfaces
    - iwconfig                                          #List available interfaces
    - airmon-ng check kill                              #Kill annoying processes
    - airmon-ng start wlan0                             #Monitor mode
    - airmon-ng stop wlan0mon                           #Managed mode
    - airodump-ng wlan0mon                              #Scan (default 2.4Ghz)
    - airodump-ng wlan0mon --band a                     #Scan 5Ghz
    - iwconfig wlan0 mode monitor                       #Put in mode monitor
    - iwconfig wlan0mon mode managed                    #Quit mode monitor - managed mode
    - iw dev wlan0 scan | grep "^BSS\|SSID\|WSP\|Authentication\|WPS\|WPA"      #Scan available wifis

# Discovering Network from the inside
- Passive
    - netdiscover -p
    - p0f -i eth0 -p -o /tmp/p0f.log
    - net.recon on/off                  #Read local ARP cache periodically
    - net.show
    - set net.show.meta true            #more info
- Active
    - nmap -sn 192.168.100.0/24

# IDS and IPS evasion
- TTL Manipulation
- Avoiding signatures
- Fragmented Packets
- Invalid checksum
- Uncommon IP and TCP options
- Overlapping