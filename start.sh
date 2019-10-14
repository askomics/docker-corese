#! /bin/sh

OPTS=""

if [ -d /load ]; then
    for filename in /load/*; do
        OPTS="${OPTS}-l ${filename} "
    done
fi

CMD="java -jar /corese/${CORESE_JAR} ${OPTS}"

$CMD
