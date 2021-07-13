#!/bin/bash
SGX=1 ./pal_loader bash -c "export RABIT_TRACKER_IP=your_IP_address && /opt/jdk8/bin/java -cp \
  '/ppml/trusted-big-data-ml/work/analytics-zoo-0.11.0-RC1/lib/analytics-zoo-bigdl_0.13.0-spark_2.4.6-0.11.0-RC1-jar-with-dependencies.jar:/ppml/trusted-big-data-ml/work/spark-2.4.6/conf/:/ppml/trusted-big-data-ml/work/spark-2.4.6/jars/*' \
  -Xmx2g \
  org.apache.spark.deploy.SparkSubmit \
  --master 'local[4]' \
  --conf spark.driver.memory=2g \
  --conf spark.executor.extraClassPath=/ppml/trusted-big-data-ml/work/analytics-zoo-0.11.0-RC1/lib/analytics-zoo-bigdl_0.13.0-spark_2.4.6-0.11.0-RC1-jar-with-dependencies.jar \
  --conf spark.driver.extraClassPath=/ppml/trusted-big-data-ml/work/analytics-zoo-0.11.0-RC1/lib/analytics-zoo-bigdl_0.13.0-spark_2.4.6-0.11.0-RC1-jar-with-dependencies.jar \
  --properties-file /ppml/trusted-big-data-ml/work/analytics-zoo-0.11.0-RC1/conf/spark-analytics-zoo.conf \
  --jars /ppml/trusted-big-data-ml/work/analytics-zoo-0.11.0-RC1/lib/analytics-zoo-bigdl_0.13.0-spark_2.4.6-0.11.0-RC1-jar-with-dependencies.jar \
  --py-files /ppml/trusted-big-data-ml/work/analytics-zoo-0.11.0-RC1/lib/analytics-zoo-bigdl_0.13.0-spark_2.4.6-0.11.0-RC1-python-api.zip \
  --executor-memory 2g \
  /ppml/trusted-big-data-ml/work/examples/pyzoo/xgboost/xgboost_classifier.py \
  -f path_of_pima_indians_diabetes_data_csv" | tee test-xgboost-classifier-sgx.log