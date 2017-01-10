## Kafka API 描述文档

> 本文的API描述基于Apache Flink 1.1.4

### 0.8版本Kafka

* consumer

  ```java
  FlinkKafkaConsumer08(String topic, DeserializationSchema<T> valueDeserializer, Properties props)
  FlinkKafkaConsumer081(String topic, DeserializationSchema<T> valueDeserializer, Properties props)
  FlinkKafkaConsumer082(String topic, DeserializationSchema<T> valueDeserializer, Properties props)
  ```

  接口说明：适配Kafka 0.8.x版本的Flink消费者源节点自定义函数构造函数，建议使用`FlinkKafkaConsumer08`接口

  参数说明：

  * `topic`：Kafka topic名

  * `valueDserializer`：反序列化模型，需要应用反序列化模型接口`DeserializationSchema<T>`，并重写反序列化接口`T deserialize(byte[] message) `，实现对从Kafka接收的字节流的反序列化

  * `props`：Kafka消费者端运行参数，主要包括fetcher和offset handler相关配置项，具体如下表所示

    |             配置项名              |                    含义                    |                    示例                    |
    | :---------------------------: | :--------------------------------------: | :--------------------------------------: |
    |             topic             |               kafka topic名               |               --topic test               |
    |       bootstrap.servers       |       Kafka集群连接串，可以由多个host:port组成        |    --bootstrap.servers localhost:9092    |
    |       zookeeper.connect       |              Zookeeper地址端口               |    --zookeeper.connect localhost:2181    |
    |           group.id            | Consumer的Group id，同一个group下的多个Consumer不会pull到重复的消息，不同group下的Consumer则会保证pull到每一条消息，同一个group下的consumer不能多于partition |            --group.id myGroup            |
    |      session.timeout.ms       | 会话超时时间，如果kafka coordinator在超时时间内没有收到来自消费者的心跳请求，将触发rebalance并认为consumer已经dead |       -- session.timeout.ms  6000        |
    |      heartbeat.frequency      | consumer每session.timeout.ms/heartbeat.frequency向coordinator发送一次心跳并等待返回 |         -- heartbeat.frequency 5         |
    |      enable.auto.commit       | 使能周期性地告知kafka当前已处理的消息offset，周期为auto.commit.interval.ms |        --enable.auto.commit true         |
    |    auto.commit.interval.ms    |                    见上                    |      --auto.commit.interval.ms 1000      |
    | partition.assignment.strategy | 分配策略，用于指定线程消费那些分区的消息，默认采用range策略（按照阶段平均分配）。比如分区有10个、线程数有3个，则线程 1消费0,1,2,3，线程2消费4,5,6,线程3消费7,8,9。另外一种是roundrobin(循环分配策略)，官方文档中写有使用该策略有两个前提条件的，所以一般不要去设定。 | --partition.assignment.strategy roundrobin |
    |       auto.offset.reset       | 指定从哪个offset开始消费消息，默认为largest，即从最新的消息开始消费，consumer只能得到其启动后producer产生的消息；也可配成smallest，则从最早的消息开始 |       --auto.offset.reset smallest       |
    |        fetch.min.bytes        | server发送到consumer的最小数据，如果不满足这个数值则会等待知道满足指定大小。 |           --fetch.min.bytes 1            |
    |                               |                                          |                                          |
    |                               |                                          |                                          |
    |                               |                                          |                                          |
    |                               |                                          |                                          |
    |                               |                                          |                                          |
    |                               |                                          |                                          |
    |                               |                                          |                                          |
    |                               |                                          |                                          |


### 0.9版本Kafka

### 0.10版本Kafka

> 暂不支持
