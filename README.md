# getmajordomus/majord-cassandra
Docker image for Apache Cassandra (single node, development only)

## Usage

To create the image `getmajordomus/majord-cassandra` execute the following command:
	
	docker build -t getmajordomus/majord-cassandra .
	

## Run Cassandra

	docker create --name majord_cassandra1 -e BROADCAST_RPC_ADDR=188.166.58.148 -p 7199:7199 -p 7000:7000 -p 7001:7001 -p 9160:9160 -p 9042:9042 getmajordomus/majord-cassandra

For further reference see [https://github.com/apache/incubator-usergrid](https://github.com/apache/incubator-usergrid) and [https://www.digitalocean.com/community/tutorials/how-to-install-cassandra-and-run-a-single-node-cluster-on-a-ubuntu-vps](https://www.digitalocean.com/community/tutorials/how-to-install-cassandra-and-run-a-single-node-cluster-on-a-ubuntu-vps)