#!/bin/bash

if [ ! -f $CASSANDRA_BASE/.cassandra_config ]; then
	if [ ! -f $CASSANDRA_HOME/conf/cassandra.yaml ]; then
		cp $CASSANDRA_BASE/cassandra_template.yaml $CASSANDRA_HOME/conf/cassandra.yaml
	fi
	
	touch $CASSANDRA_BASE/.cassandra_config
	
fi

# launch cassandra in the foreground
$CASSANDRA_HOME/bin/cassandra -f