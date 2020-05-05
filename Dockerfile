FROM alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && apk add filebeat && \
    chmod -R 777 /etc/filebeat/filebeat.yml && \
    chmod -R 777 /usr/bin/filebeat && \
    mkdir /data && chmod -R 777 /data

ENTRYPOINT ["filebeat", "-e", "-c", "/etc/filebeat/filebeat.yml"]
