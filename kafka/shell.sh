# 创建一个topic
docker exec -it kafka2.11 kafka-topics.sh --create --zookeeper 192.168.1.3:2181 --replication-factor 1 --partitions 1 --topic test

# 创建消费者
docker exec -it kafka2.11 kafka-console-consumer.sh --bootstrap-server 192.168.1.3:9092 --topic test --from-beginning

# 创建生产者
docker exec -it kafka2.11 kafka-console-producer.sh --broker-list 192.168.1.3:9092 --topic test