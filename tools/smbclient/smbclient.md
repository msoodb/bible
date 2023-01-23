export IP=10.10.141.249

smbclient -L \\\\$IP
smbclient \\\\$IP\\anonymous
smbclient  -U  milesdyson //$IP/milesdyson
