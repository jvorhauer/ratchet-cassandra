# ratchetcc/ratchet-cassandra
Docker image for Apache Cassandra (single node, development only)

## Usage

To create the image `ratchetcc/ratchet-cassandra` execute the following command:
	
	docker build -t ratchetcc/ratchet-cassandra .
	

## Run

	docker create --name majord_cassandra1 -e CASSANDRA_BROADCAST_RPC_ADDR=192.168.178.22 -p 7199:7199 -p 7000:7000 -p 7001:7001 -p 9160:9160 -p 9042:9042 ratchetcc/ratchet-cassandra sh /opt/cassandra/run.sh

For further reference see [https://github.com/apache/incubator-usergrid](https://github.com/apache/incubator-usergrid) and [https://www.digitalocean.com/community/tutorials/how-to-install-cassandra-and-run-a-single-node-cluster-on-a-ubuntu-vps](https://www.digitalocean.com/community/tutorials/how-to-install-cassandra-and-run-a-single-node-cluster-on-a-ubuntu-vps)