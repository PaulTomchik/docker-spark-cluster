FROM paultomchik/hadoop-cluster
MAINTAINER Paul Tomchik

#support for Hadoop 2.6.0
RUN curl -s http://d3kbcqa49mib13.cloudfront.net/spark-1.6.0-bin-hadoop2.6.tgz | tar -xz -C /usr/local/

RUN cd /usr/local && ln -s spark-1.6.0-bin-hadoop2.6 spark

RUN echo 'JAVA_HOME=/usr/java/default/' >> /etc/environment
RUN echo 'PATH=$JAVA_HOME/bin:$PATH' >> /etc/environment

ENV SPARK_HOME /usr/local/spark

RUN mkdir $SPARK_HOME/yarn-remote-client

ADD yarn-remote-client $SPARK_HOME/yarn-remote-client

ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop

ENV PATH $PATH:$SPARK_HOME/bin:$HADOOP_PREFIX/bin

# update boot script
COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh", "-d"]
