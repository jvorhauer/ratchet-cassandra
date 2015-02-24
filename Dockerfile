FROM getmajordomus/majord-java
MAINTAINER Michael Kuehl <hello@ratchet.cc>

ENV CASSANDRA_VERSION 2.1.3
ENV CASSANDRA_HOME /opt/cassandra
	
# Download Apache Cassandra
WORKDIR /tmp/cassandra

RUN wget http://www.us.apache.org/dist/cassandra/${CASSANDRA_VERSION}/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz
RUN tar -xvzf apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz && mv apache-cassandra-${CASSANDRA_VERSION} ${CASSANDRA_HOME}
RUN mkdir /var/lib/cassandra && mkdir /var/log/cassandra
RUN chown -R $USER:$GROUP /var/lib/cassandra && chown -R $USER:$GROUP /var/log/cassandra
RUN echo "export PATH=$PATH:$CASSANDRA_HOME/bin" >> /etc/profile

# Add the config file
ADD cassandra.yaml ${CASSANDRA_HOME}/cassandra_template.yaml
ADD cassandra.yaml ${CASSANDRA_HOME}/conf/cassandra.yaml

# Add the startscript to get going
ADD run.sh /run.sh
RUN chmod +x /*.sh

# Environment variables etc
VOLUME ${CASSANDRA_HOME}/conf

ENV CASSANDRA_CLUSTER_NAME cassandra_dev
ENV CASSANDRA_SEEDER 127.0.0.1
ENV CASSANDRA_BROADCAST_ADDR localhost
ENV CASSANDRA_LISTEN_ADDR localhost
ENV CASSANDRA_RPC_ADDR 0.0.0.0
ENV CASSANDRA_BROADCAST_RPC_ADDR 127.0.0.1

EXPOSE 7199 7000 7001 9160 9042

CMD ["/run.sh"]