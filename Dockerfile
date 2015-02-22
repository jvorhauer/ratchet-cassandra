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
#ADD cassandra.yaml /etc/cassandra/conf/cassandra.yaml
ADD cassandra.yaml /opt/cassandra/conf/cassandra.yaml

# Add the startscript to get going
ADD run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 7199 7000 7001 9160 9042

CMD ["/run.sh"]