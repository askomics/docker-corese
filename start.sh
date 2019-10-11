#! /bin/sh

OPTS=""

if [ -d /load ]; then
    for filename in /load/*; do
        OPTS="${OPTS}-l ${filename} "
    done
fi

CMD="java -jar corese-server/target/corese-server-4.1.1-jar-with-dependencies.jar ${OPTS}"

$CMD
