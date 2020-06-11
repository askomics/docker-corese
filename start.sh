#! /bin/sh

OPTS=""

if [ -d /load ]; then
    for filename in /load/*; do
        OPTS="${OPTS}-l ${filename} "
    done
fi

CMD="java -Xms${MEM} -Xmx${MEM} -jar /corese/corese-server-${CORESE_VERSION}-jar-with-dependencies.jar ${OPTS}"

$CMD
