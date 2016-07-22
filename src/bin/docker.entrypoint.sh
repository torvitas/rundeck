#!/bin/bash
source /usr/local/src/rundeck/bin/docker.entrypoint.functions.sh

# ensuring everything is where it should be
initRundeck
source /etc/rundeck/profile

case ${1} in
    rundeckd)
        prog="rundeckd"
        rundeckd="${JAVA_HOME:-/usr}/bin/java ${RDECK_JVM} -cp ${BOOTSTRAP_CP} com.dtolabs.rundeck.RunServer /var/lib/rundeck ${RDECK_HTTP_PORT}"
        runuser -s /bin/bash -l rundeck -c "$rundeckd"
esac

bash -c "${@}"
