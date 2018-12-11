FROM ubuntu:18.04

MAINTAINER Xavier Garnier "xavier.garnier@irisa.fr"

ENV CORESE_URL=https://codeload.github.com/Wimmics/corese/tar.gz/
ENV CORESE_VERSION=4.0.2
ENV CORESE=${CORESE_URL}v${CORESE_VERSION}

WORKDIR /

RUN apt update && apt install -y openjdk-8-jdk maven curl && \
    curl $CORESE > $CORESE_VERSION.tgz && \
    tar -xvf $CORESE_VERSION.tgz && \
    cd /corese-$CORESE_VERSION && \
    mvn -Dmaven.test.skip=true package

WORKDIR /corese-$CORESE_VERSION
EXPOSE 8080
CMD ["java", "-jar","corese-server/target/corese-server-4.0.2-SNAPSHOT-jar-with-dependencies.jar"]
