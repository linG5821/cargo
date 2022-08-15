#!/bin/bash
# 此脚本如果不停的变换IP会反复追加, 可以优化
echo -e "brokerIP1=${BROKER_IP1}" >> /opt/rocketmq-${ROCKETMQ_VERSION}/conf/broker.conf
sh mqbroker -c /opt/rocketmq-${ROCKETMQ_VERSION}/conf/broker.conf