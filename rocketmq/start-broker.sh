#!/bin/bash
broker_conf=/home/rocketmq/rocketmq-${ROCKETMQ_VERSION}/conf/broker.conf
cat /opt/rocketmq-${ROCKETMQ_VERSION}/conf/default.conf > $broker_conf
sed -ie 's/^brokerIP1.*/brokerIP1='$BROKER_IP1'/;s/^listenPort.*/listenPort='$BROKER_LISTEN_PORT'/;s/^brokerName.*/brokerName='$BROKER_NAME'/;s/^brokerId.*/brokerId='$BROKER_ID'/;s/^brokerRole.*/brokerRole='$BROKER_ROLE'/;s/^brokerClusterName.*/brokerClusterName='$BROKER_CLUSTER_NAME'/' $broker_conf

sh mqbroker -c $broker_conf
