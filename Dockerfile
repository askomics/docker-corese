FROM alpine:3.9

MAINTAINER Xavier Garnier "xavier.garnier@irisa.fr"

ENV CORESE_URL=https://codeload.github.com/Wimmics/corese/tar.gz/
ENV CORESE_VERSION=4.1.1-rc1
ENV CORESE=${CORESE_URL}v${CORESE_VERSION}

WORKDIR /

RUN apk --no-cache add --update openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    apk add --no-cache maven curl && \
    curl $CORESE > $CORESE_VERSION.tgz && \
    tar -xvf $CORESE_VERSION.tgz && \
    rm -rf $CORESE_VERSION.tgz && \
    cd /corese-$CORESE_VERSION && \
    mvn -Dmaven.test.skip=true package

WORKDIR /corese-$CORESE_VERSION
EXPOSE 8080
CMD ["java", "-jar","corese-server/target/corese-server-4.1.1-jar-with-dependencies.jar"]
