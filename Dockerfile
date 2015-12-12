FROM getmajordomus/majord-java
MAINTAINER Michael Kuehl <hello@ratchet.cc>

ENV CASSANDRA_VERSION 2.2.4
ENV CASSANDRA_BASE /opt/cassandra
ENV CASSANDRA_HOME /opt/cassandra/apache-cassandra

# Some folders we need later on
RUN mkdir -p /var/lib/cassandra && mkdir -p /var/log/cassandra && mkdir -p ${CASSANDRA_BASE}
	
# Download Apache Cassandra
WORKDIR /tmp/cassandra
RUN wget http://artfiles.org/apache.org/cassandra/${CASSANDRA_VERSION}/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz

RUN tar -xvzf apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz -C ${CASSANDRA_BASE}
RUN mv ${CASSANDRA_BASE}/apache-cassandra-${CASSANDRA_VERSION} ${CASSANDRA_BASE}/apache-cassandra

# Add the config file
ADD cassandra.yaml ${CASSANDRA_BASE}/cassandra_template.yaml
ADD cassandra.yaml ${CASSANDRA_HOME}/conf/cassandra.yaml

# Add the startscript to get going
ADD run.sh ${CASSANDRA_BASE}/run.sh
RUN chmod +x ${CASSANDRA_BASE}/*.sh

# setup of the environment
RUN echo "export PATH=$PATH:$CASSANDRA_BASE/apache-cassandra/bin" >> /etc/profile
RUN echo "export CASSANDRA_BASE=$CASSANDRA_BASE" >> /etc/profile
RUN echo "export CASSANDRA_HOME=$CASSANDRA_HOME" >> /etc/profile

# volumes that can be mounted
VOLUME ${CASSANDRA_HOME}/conf
VOLUME ${CASSANDRA_BASE}/data

# defaults
ENV CASSANDRA_CLUSTER_NAME cassandra_dev
ENV CASSANDRA_SEEDER 127.0.0.1
ENV CASSANDRA_BROADCAST_ADDR localhost
ENV CASSANDRA_LISTEN_ADDR localhost
ENV CASSANDRA_RPC_ADDR 0.0.0.0
ENV CASSANDRA_BROADCAST_RPC_ADDR 127.0.0.1

# ports 
EXPOSE 7199 7000 7001 9160 9042

# entrypoint
WORKDIR $CASSANDRA_BASE
#CMD ["run.sh"]