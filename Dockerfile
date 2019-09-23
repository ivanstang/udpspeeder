FROM alpine:3.7
LABEL maintainer="York <ivanstang0415@gmail.com>"

RUN mkdir /app \
 && cd /app \
 && wget https://github.com/wangyu-/UDPspeeder/releases/download/20180522.0/speederv2_binaries.tar.gz \
 && tar xvfz speederv2_binaries.tar.gz \
 && ls | grep -v speederv2_amd64 | xargs rm \
 && mv speederv2_amd64 speederv2

ENV LISTEN_IP=0.0.0.0
ENV LISTEN_PORT=4096
ENV TARGET_IP=127.0.0.1
ENV TARGET_PORT=8443
ENV FEC=10:6
ENV KEY=""
ENV TIMEOUT=3

ENTRYPOINT [ "/bin/sh", "-c", "/app/speederv2 -s -l ${LISTEN_IP}:${LISTEN_PORT} -r ${TARGET_IP}:${TARGET_PORT} -f 10:6 -k ${KEY} --timeout ${TIMEOUT}" ]
