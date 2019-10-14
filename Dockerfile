FROM alpine:3.9

MAINTAINER Xavier Garnier "xavier.garnier@irisa.fr"

ENV CORESE_GIT_URL=https://github.com/Wimmics/corese.git
ENV CORESE_GIT_VERSION=master
ENV CORESE_JAR=corese-server-4.1.1-jar-with-dependencies.jar

RUN apk --no-cache add --update openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    apk add --no-cache maven git && \
    git clone -b ${CORESE_GIT_VERSION} --single-branch --depth=1 ${CORESE_GIT_URL} /corese_source && \
    cd /corese_source && \
    mvn -Dmaven.test.skip=true package && \
    mkdir /corese && mv /corese_source/corese-server/target/${CORESE_JAR} /corese/${CORESE_JAR} && \
    rm -rf /corese_source && \
    apk del maven

COPY start.sh /start.sh

WORKDIR /corese
EXPOSE 8080
CMD ["/start.sh"]
