# Distributed-Computing-Systems-Project
分布式计算系统

##### 主要命令及参数：

普通机制的HashShuffle

```shell
spark-1.6.3/bin/spark-submit \
--deploy-mode client \
--master spark://10-24-13-58:7077 \
--class cn.edu.ecnu.spark.example.java.wordcount.WordCount \
--executor-cores 2 \
--executor-memory 14G \
--conf spark.shuffle.manager=hash \
--conf spark.shuffle.consolidateFiles=false \
--conf spark.shuffle.sort.bypassMergeThreshold=200 \
--conf spark.shuffle.file.buffer=32k \
--conf spark.reducer.maxSizeInFlight=48m \
--conf spark.shuffle.io.maxRetries=3 \
--conf spark.shuffle.io.retryWait=5s \
--conf spark.shuffle.memoryFraction=0.2 \
/home/ubuntu/spark-1.6.3/myApp/RddWordCount1.jar \
hdfs://localhost:9000/user/ubuntu/spark_input \
hdfs://localhost:9000/user/ubuntu/spark_output
```

合并机制的 HashShuffle

```shell
./spark-1.6.3/bin/spark-submit \
--deploy-mode client \
--master spark://10-24-13-58:7077 \
--class cn.edu.ecnu.spark.example.java.wordcount.WordCount \
--executor-cores 2 \
--executor-memory 14G \
--conf spark.shuffle.manager=hash \
--conf spark.shuffle.consolidateFiles=true \
--conf spark.shuffle.sort.bypassMergeThreshold=200 \
--conf spark.shuffle.file.buffer=32k \
--conf spark.reducer.maxSizeInFlight=48m \
--conf spark.shuffle.io.maxRetries=3 \
--conf spark.shuffle.io.retryWait=5s \
--conf spark.shuffle.memoryFraction=0.2 \
/home/ubuntu/spark-1.6.3/myApp/RddWordCount5000.jar \
hdfs://localhost:9000/user/ubuntu/spark_input \
hdfs://localhost:9000/user/ubuntu/spark_output
```

SortShuffle

```shell
spark-1.6.3/bin/spark-submit \
--deploy-mode client \
--master spark://10-24-13-58:7077 \
--class cn.edu.ecnu.spark.example.java.wordcount.WordCount \
--executor-cores 2 \
--executor-memory 14G \
--conf spark.shuffle.manager=sort \
--conf spark.shuffle.consolidateFiles=false \
--conf spark.shuffle.sort.bypassMergeThreshold=200 \
--conf spark.shuffle.file.buffer=32k \
--conf spark.reducer.maxSizeInFlight=48m \
--conf spark.shuffle.io.maxRetries=3 \
--conf spark.shuffle.io.retryWait=5s \
--conf spark.shuffle.memoryFraction=0.2 \
/home/ubuntu/spark-1.6.3/myApp/WordCount-task10.jar \
hdfs://localhost:9000/user/ubuntu/spark_input \
hdfs://localhost:9000/user/ubuntu/spark_output
```

TeraSort-产生随机数

```shell
spark-1.6.3/bin/spark-submit \
--class org.apache.spark.examples.TeraGen \
--deploy-mode client \
--master spark://10-24-13-58:7077 \
--executor-cores 8 \
--executor-memory 14G \
/home/ubuntu/spark-1.6.3/myApp/spark-examples-TeraSort.jar \
10g \
hdfs://localhost:9000/user/ubuntu/TeraSort_input
```

TeraSort-执行

```shell
spark-1.6.3/bin/spark-submit \
--class org.apache.spark.examples.TeraSort \
--deploy-mode client \
--master spark://10-24-13-58:7077 \
--executor-cores 2 \
--executor-memory 14G \
--conf spark.shuffle.manager=hash \
--conf spark.shuffle.consolidateFiles=false \
/home/ubuntu/spark-1.6.3/myApp/spark-examples-TeraSort.jar \
hdfs://localhost:9000/user/ubuntu/TeraSort_input \
hdfs://localhost:9000/user/ubuntu/TeraSort_output
```

