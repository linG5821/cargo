FROM openjdk:8-alpine

ENV SERVER_PORT="8858" \
  SERVER_API_PORT="8719" \
  DASHBOARD_SERVER="localhost:8858" \
  PROJECT_NAME="sentinel-dashboard" \
  JAVA_OPTS="" \
  TIME_ZONE="Asia/Shanghai"

ARG BASE_DIR="/opt/sentinel"
ARG SENTINEL_DASHBOARD_VERSION=1.8.1

ENV SENTINEL_DASHBOARD_VERSION=${SENTINEL_DASHBOARD_VERSION}

WORKDIR $BASE_DIR

RUN set -x \
  && apk update \
  && apk --no-cache add ca-certificates wget \
  && update-ca-certificates \
  && wget https://github.com/alibaba/Sentinel/releases/download/${SENTINEL_DASHBOARD_VERSION}/sentinel-dashboard-${SENTINEL_DASHBOARD_VERSION}.jar -P $BASE_DIR \
  && ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo '$TIME_ZONE' > /etc/timezone

ADD docker-entrypoint.sh docker-entrypoint.sh

RUN chmod +x docker-entrypoint.sh

EXPOSE 8858 8719

ENTRYPOINT ["./docker-entrypoint.sh"]

