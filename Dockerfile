FROM alpine:3.9 AS builder

MAINTAINER Xavier Garnier "xavier.garnier@irisa.fr"

# Corese version 20.6.11
ENV CORESE_GIT_URL=https://github.com/Wimmics/corese.git
ENV CORESE_GIT_COMMIT=2783afb317d0a97aa000984b23c7e7d1f82fe137
ENV CORESE_JAR=corese-server-4.1.1-jar-with-dependencies.jar
ENV CORESE_VERSION=20.6.11

RUN apk --no-cache add --update openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    apk add --no-cache maven git && \
    git clone --single-branch ${CORESE_GIT_URL} /corese-source && \
    cd /corese-source && \
    git checkout ${CORESE_GIT_COMMIT} && \
    mvn -Dmaven.test.skip=true package && \
    mv /corese-source/corese-server/target/${CORESE_JAR} /corese-source/corese-server/target/corese-server-${CORESE_VERSION}-jar-with-dependencies.jar

FROM alpine:3.9

# JVM memory
ENV MEM=1G
# Corese version
ENV CORESE_VERSION=20.6.11

RUN apk --no-cache add --update openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    mkdir /corese

COPY --from=builder /corese-source/corese-server/target/corese-server-${CORESE_VERSION}-jar-with-dependencies.jar /corese
COPY start.sh /corese/start.sh

WORKDIR /corese
EXPOSE 8080
CMD sh /corese/start.sh
