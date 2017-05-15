#!/bin/bash

USAGE="-e Usage: elasticsearch-daemon.sh\t{start|stop}\n"

if [[ "$@" = *-help ]] || [[ "$@" = *-h ]]; then
  echo $USAGE
  exit 1
fi

if [ -z "${ELASTICSEARCH_HOME}" ]; then
  export ELASTICSEARCH_HOME="$(cd "`dirname "$0"`"/..; pwd)"
fi

. "${ELASTICSEARCH_HOME}/bin/elasticsearch-env.sh"

function start() {
  if [ ! -d "${ELASTICSEARCH_PID}" ]; then
    echo "elasticsearch pid directory is not exists, while create it ..."
    mkdir "${ELASTICSEARCH_PID}"
    "${ELASTICSEARCH_HOME}"/bin/elasticsearch -d -p "${ELASTICSEARCH_PID}"/elasticsearch.pid
    exit 0
  elif [ ! -f "${ELASTICSEARCH_PID}"/elasticsearch.pid ]; then
    "${ELASTICSEARCH_HOME}"/bin/elasticsearch -d -p "${ELASTICSEARCH_PID}"/elasticsearch.pid
    exit 0
  else
    echo "elasticsearch pid file ${ELASTICSEARCH_PID}/elasticsearch.pid is already exists."
    echo "pid `cat ${ELASTICSEARCH_PID}/elasticsearch.pid`"
    exit 1
  fi
}

function stop() {
  if [ -f "${ELASTICSEARCH_PID}"/elasticsearch.pid ]; then
    kill `cat "${ELASTICSEARCH_PID}"/elasticsearch.pid`
    exit 0
  else
    echo "elasticsearch pid file is not exists."
    exit 1
  fi
}

case "${1}" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  *)
    echo ${USAGE}
esac
