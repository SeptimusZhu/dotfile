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

    |       配置项名        |      含义      |      示例      |
    | :---------------: | :----------: | :----------: |
    |       topic       | kafka topic名 | --topic test |
    | bootstrap.servers |              |              |

    ​

### 0.9版本Kafka

### 0.10版本Kafka

> 暂不支持

