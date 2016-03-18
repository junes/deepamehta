#!/bin/sh
cd "$(dirname "$0")"
if [ -z $1 ]; then
    CONFIG="/etc/deepamehta/deepamehta.conf"
else
    CONFIG="$1"
fi
if [ ! -f ${CONFIG} ]; then
    echo "ERROR! Config file ${CONFIG} not found."
    exit 1
fi

# Read configuration variables file if it is present
[ -r /etc/default/${NAME} ] && . /etc/default/${NAME}

exec java -Xms${DM_JAVA_XMS}M -Xmx${DM_JAVA_XMX}M -Dfile.encoding=UTF-8 -Dfelix.system.properties=file:${CONFIG} -jar bin/felix.jar
