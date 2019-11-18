FROM alpine:3.9 AS builder

MAINTAINER Xavier Garnier "xavier.garnier@irisa.fr"

ENV CORESE_GIT_URL=https://github.com/Wimmics/corese.git
ENV CORESE_GIT_VERSION=master
ENV CORESE_JAR=corese-server-4.1.1-jar-with-dependencies.jar

RUN apk --no-cache add --update openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    apk add --no-cache maven git && \
    git clone -b ${CORESE_GIT_VERSION} --single-branch --depth=1 ${CORESE_GIT_URL} /corese_source && \
    cd /corese_source && \
    mvn -Dmaven.test.skip=true package && \
    mv /corese_source/corese-server/target/${CORESE_JAR} /corese_source/corese-server/target/corese-server.jar

FROM alpine:3.9
RUN apk --no-cache add --update openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    mkdir /corese

COPY --from=builder /corese_source/corese-server/target/corese-server.jar /corese
COPY start.sh /corese/start.sh

WORKDIR /corese
EXPOSE 8080
CMD sh /corese/start.sh
