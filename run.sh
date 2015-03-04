#!/bin/bash

if [ ! -f /root/.cassandra_config ]; then
	CONF_FILE=/opt/cassandra/conf/cassandra.yaml
	
	if [ ! -f /opt/cassandra/conf/cassandra.yaml ]; then
		cp /opt/cassandra/cassandra_template.yaml /opt/cassandra/conf/cassandra.yaml
	fi
	
	# Cluster Name
	echo "cluster_name: '$CASSANDRA_CLUSTER_NAME'" >> $CONF_FILE
	
	# Add IPs
	echo "broadcast_address: $CASSANDRA_BROADCAST_ADDR" >> $CONF_FILE
	echo "listen_address: $CASSANDRA_LISTEN_ADDR" >> $CONF_FILE
	echo "rpc_address: $CASSANDRA_RPC_ADDR" >> $CONF_FILE
	echo "broadcast_rpc_address: $CASSANDRA_BROADCAST_RPC_ADDR" >> $CONF_FILE
	
	# Add seed info
    echo "seed_provider:" >> $CONF_FILE
    echo "  - class_name: org.apache.cassandra.locator.SimpleSeedProvider" >> $CONF_FILE
    echo "    parameters:" >> $CONF_FILE
    echo "      - seeds: \"$CASSANDRA_SEEDER\"" >> $CONF_FILE
	
    touch /root/.cassandra_config
fi

# launch cassandra in the foreground
/opt/cassandra/bin/cassandra -f