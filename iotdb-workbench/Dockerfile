FROM  openjdk:8-jdk-oracle

ENV JAVA_OPTS="-Xmx1024m -Xms1024m -XX:MetaspaceSize=256m -XX:MaxMetaspaceSize=256m"

RUN mkdir /data

COPY ./backend/workbench.jar /app/app.jar
COPY ./backend/iotdb.db /data/iotdb.db

WORKDIR /app

EXPOSE 9090

ENTRYPOINT ["sh", "-c", "exec java ${JAVA_OPTS} -jar /app/app.jar"]