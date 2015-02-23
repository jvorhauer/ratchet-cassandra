#!/bin/bash

if [ ! -f /root/.cassandra_config ]; then
	CONF_FILE=/opt/cassandra/conf/cassandra.yaml
	
	# Add IPs
	echo "broadcast_address: $BROADCAST_ADDR" >> $CONF_FILE
	echo "listen_address: $LISTEN_ADDR" >> $CONF_FILE
	echo "rpc_address: $RPC_ADDR" >> $CONF_FILE
	echo "broadcast_rpc_address: $BROADCAST_RPC_ADDR" >> $CONF_FILE
	
	# Add seed info
    echo "seed_provider:" >> $CONF_FILE
    echo "  - class_name: org.apache.cassandra.locator.SimpleSeedProvider" >> $CONF_FILE
    echo "    parameters:" >> $CONF_FILE
    echo "      - seeds: \"$SEEDER\"" >> $CONF_FILE
	
    touch /root/.cassandra_config
fi

# launch cassandra in the foreground
/opt/cassandra/bin/cassandra -f