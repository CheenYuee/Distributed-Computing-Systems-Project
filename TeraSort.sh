num_lst=(1 2 3 4 5)
jar_lst=(spark-examples-TeraSort.jar)
for jar in "${jar_lst[@]}"; do
  for num in "${num_lst[@]}"; do
    hadoop-2.10.1/bin/hdfs dfs -rm -r TeraSort_output
    spark-1.6.3/bin/spark-submit \
    --deploy-mode client \
    --master spark://10-24-13-58:7077 \
    --class org.apache.spark.examples.TeraSort \
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
    /home/ubuntu/spark-1.6.3/myApp/"${jar}" \
    hdfs://localhost:9000/user/ubuntu/TeraSort_input \
    hdfs://localhost:9000/user/ubuntu/TeraSort_output
    done
done