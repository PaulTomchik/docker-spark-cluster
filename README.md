##This repo makes minor changes to the original repo found here: https://github.com/sequenceiq/docker-spark

####This repo was modified to support docker-compose startup with 3 nodes and data persistence.

This Docker image depends on another Docker image found here:
https://github.com/PaulTomchik/docker-hadoop-cluster

It too is a based almost entirely on the sequenceiq repo/image.

Available on Docker Hub:
`docker pull paultomchik/spark-cluster`

To start the cluster:
    `./startCluster.sh`

To stop the cluster:
    `./stopCluster.sh`
