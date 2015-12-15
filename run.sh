#!/bin/bash

#if [ ! -f $CASSANDRA_BASE/.cassandra_config ]; then
#	CONF_FILE=$CASSANDRA_HOME/conf/cassandra.yaml
#	
#	if [ ! -f $CASSANDRA_HOME/conf/cassandra.yaml ]; then
#		cp $CASSANDRA_BASE/cassandra_template.yaml $CASSANDRA_HOME/conf/cassandra.yaml
#	fi
#	
#	# Cluster Name
#	echo "cluster_name: '$CASSANDRA_CLUSTER_NAME'" >> $CONF_FILE
#	
#	# Add IPs
#	echo "broadcast_address: $CASSANDRA_BROADCAST_ADDR" >> $CONF_FILE
#	echo "listen_address: $CASSANDRA_LISTEN_ADDR" >> $CONF_FILE
#	echo "rpc_address: $CASSANDRA_RPC_ADDR" >> $CONF_FILE
#	echo "broadcast_rpc_address: $CASSANDRA_BROADCAST_RPC_ADDR" >> $CONF_FILE
#	
#	# Add seed info
#   echo "seed_provider:" >> $CONF_FILE
#   echo "  - class_name: org.apache.cassandra.locator.SimpleSeedProvider" >> $CONF_FILE
#   echo "    parameters:" >> $CONF_FILE
#   echo "      - seeds: \"$CASSANDRA_SEEDER\"" >> $CONF_FILE
#	
#   touch $CASSANDRA_BASE/.cassandra_config
#fi

# launch cassandra in the foreground
$CASSANDRA_HOME/bin/cassandra -f