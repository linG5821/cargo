FROM privoce/vocechat-server

ENV TZ=Asia/Shanghai

COPY ./zoneinfo /usr/share/zoneinfo

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
  echo $TZ > /etc/timezone