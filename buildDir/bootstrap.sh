#!/bin/bash

: ${HADOOP_PREFIX:=/usr/local/hadoop}

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh


# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_PREFIX/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

# setting spark defaults
echo spark.yarn.jar hdfs:///spark/spark-assembly-1.6.0-hadoop2.6.0.jar > $SPARK_HOME/conf/spark-defaults.conf
cp $SPARK_HOME/conf/metrics.properties.template $SPARK_HOME/conf/metrics.properties


service ssh start

if [[ ${CLUSTER_ROLE} == "master" ]]; then

    # if namenode not formatted, format it and add spark
    if [[ ! -d /data/dfs/name/current ]]; then
        echo 'Y' | ${HADOOP_PREFIX}/bin/hdfs namenode -format

        /usr/local/hadoop/sbin/start-dfs.sh
        /usr/local/hadoop/sbin/start-yarn.sh

        ${HADOOP_PREFIX}/bin/hadoop dfsadmin -safemode leave
        ${HADOOP_PREFIX}/bin/hdfs dfs -put $SPARK_HOME-1.6.0-bin-hadoop2.6/lib /spark
    else
        /usr/local/hadoop/sbin/start-dfs.sh
        /usr/local/hadoop/sbin/start-yarn.sh
    fi
fi


if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
