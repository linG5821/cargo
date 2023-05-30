FROM node:16-alpine as builder

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories && \
  apk update && \
  apk add git openssh && \
  npm config set registry https://registry.npm.taobao.org

WORKDIR /opt/app

RUN git clone https://github.com/digitalocean/nginxconfig.io.git

RUN cd nginxconfig.io && \
  npm ci && npm run build

FROM nginx

ADD ./nginx.conf /etc/nginx/conf.d/default.conf

ADD ./docker-entrypoint.sh /docker-entrypoint.sh

COPY --from=builder /opt/app/nginxconfig.io/dist /usr/share/nginx/html

EXPOSE 80

CMD ["sh","/docker-entrypoint.sh"]
