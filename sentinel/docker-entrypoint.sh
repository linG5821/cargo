#!/bin/sh
#startup Server
RUN_CMD="java"

# 应用参数
RUN_CMD="$RUN_CMD -Dserver.port=$SERVER_PORT"
RUN_CMD="$RUN_CMD -Dcsp.sentinel.api.port=$SERVER_API_PORT"
RUN_CMD="$RUN_CMD -Dcsp.sentinel.dashboard.server=$DASHBOARD_SERVER"
RUN_CMD="$RUN_CMD -Dproject.name=$PROJECT_NAME"

RUN_CMD="$RUN_CMD $JAVA_OPTS"
RUN_CMD="$RUN_CMD -jar"
RUN_CMD="$RUN_CMD sentinel-dashboard-$SENTINEL_DASHBOARD_VERSION.jar"

echo $RUN_CMD
exec $RUN_CMD