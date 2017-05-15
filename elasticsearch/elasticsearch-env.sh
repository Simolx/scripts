if [ -z "${ELASTICSEARCH_HOME}" ]; then
  export ELASTICSEARCH_HOME="$(cd "`dirname "$0"`"/..; pwd)"
fi

export ELASTICSEARCH_PID="${ELASTICSEARCH_PID:-"${ELASTICSEARCH_HOME}/pid"}"
export ES_HEAP_SIZE="${ES_HEAP_SIZE:-"16g"}"
