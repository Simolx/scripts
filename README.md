# scripts
my scripts

1. elasticsearch daemon scripts

```bash
    cp elasticsearch/elasticsearch-env.sh ${ELASTICSEARCH_HOME}/bin
    cp elasticsearch/elasticsearch-daemon.sh ${ELASTICSEARCH_HOME}/bin
    chmod +x ${ELASTICSEARCH_HOME}/bin/elasticsearch-env.sh
    ${ELASTICSEARCH_HOME}/bin/elasticsearch-daemon.sh
```
