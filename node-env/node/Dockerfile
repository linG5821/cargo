FROM node:14.15.3-alpine3.12

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories && \
    apk update && \
    apk add git openssh && \
    npm config set registry https://registry.npm.taobao.org

RUN npm install -g @vue/cli && \
    npm install -g @vue/cli-init

VOLUME [ "/usr/src/projects" ]
WORKDIR /usr/src/projects