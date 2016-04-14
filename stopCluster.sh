docker exec hadoop_master /bin/bash -c "/usr/local/hadoop/sbin/stop-dfs.sh && /usr/local/hadoop/sbin/stop-yarn.sh"

docker-compose down -v
