### 镜像构建
1. 拉取 https://github.com/apache/rocketmq-docker 
2. 构建镜像
```
cd image-build
sh build-image.sh RMQ-VERSION BASE-IMAGE
```
3. 变更.env ROCKETMQ_VERSION 为对应版本