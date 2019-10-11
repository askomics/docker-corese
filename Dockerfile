FROM alpine:3.9

MAINTAINER Xavier Garnier "xavier.garnier@irisa.fr"

ENV CORESE_GIT_URL=https://github.com/Wimmics/corese.git
ENV CORESE_VERSION=master

RUN apk --no-cache add --update openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    apk add --no-cache maven git && \
    git clone -b ${CORESE_VERSION} --single-branch --depth=1 ${CORESE_GIT_URL} /corese && \
    cd /corese && \
    mvn -Dmaven.test.skip=true package

COPY start.sh /start.sh

WORKDIR /corese
EXPOSE 8080
CMD ["/start.sh"]
