#!/bin/sh

ELASTICSEARCH_SERVICE_NAME=$(echo "${ELASTICSEARCH_SERVICE_NAME:-ELASTICSEARCH}" | awk '{print toupper($0)}')
SVC_HOST=${ELASTICSEARCH_SERVICE_NAME}_SERVICE_HOST
SVC_PORT=${ELASTICSEARCH_SERVICE_NAME}_SERVICE_PORT
ELASTICSEARCH_SCHEME=${ELASTICSEARCH_SCHEME:-http}

FLUENTD_FLUSH_INTERVAL=${FLUENTD_FLUSH_INTERVAL:-60s}
FLUENTD_FLUSH_THREADS=${FLUENTD_FLUSH_THREADS:-1}
FLUENTD_RETRY_LIMIT=${FLUENTD_RETRY_LIMIT:-10}
FLUENTD_RETRY_WAIT=${FLUENTD_RETRY_WAIT:-1s}
FLUENTD_BUFFER_CHUNK_LIMIT=${FLUENTD_BUFFER_CHUNK_LIMIT:-8m}
FLUENTD_BUFFER_QUEUE_LIMIT=${FLUENTD_BUFFER_QUEUE_LIMIT:-256}
FLUENTD_BUFFER_TYPE=${FLUENTD_BUFFER_TYPE:-memory}
FLUENTD_BUFFER_PATH=${FLUENTD_BUFFER_PATH:-/var/fluentd/buffer}

mkdir /etc/fluent

cat << 'EOF' > /etc/fluent/fluent.conf
<source>
  type tail
  path /var/lib/docker/containers/*/*-json.log
  pos_file /etc/fluent/fluentd-docker.pos
  time_format %Y-%m-%dT%H:%M:%S
  tag docker.*
  format json
</source>

<match docker.var.lib.docker.containers.*.*.log>
  type kubernetes
  container_id ${tag_parts[5]}
  tag docker.${name}
</match>

<match kubernetes>
  type elasticsearch
  logstash_format true
  reload_connections false
  time_key time
EOF

cat << EOF >> /etc/fluent/fluent.conf
  host $(eval echo \$${SVC_HOST})
  port $(eval echo \$${SVC_PORT})
  scheme ${ELASTICSEARCH_SCHEME}
  $([ -n "${ELASTICSEARCH_USER}" ] && echo user ${ELASTICSEARCH_USER})
  $([ -n "${ELASTICSEARCH_PASSWORD}" ] && echo password ${ELASTICSEARCH_PASSWORD})
  buffer_type ${FLUENTD_BUFFER_TYPE}
  $([ "${FLUENTD_BUFFER_TYPE}" == "file" ] && echo buffer_path ${FLUENTD_BUFFER_PATH})
  buffer_chunk_limit ${FLUENTD_BUFFER_CHUNK_LIMIT}
  buffer_queue_limit ${FLUENTD_BUFFER_QUEUE_LIMIT}
  flush_interval ${FLUENTD_FLUSH_INTERVAL}
  retry_limit ${FLUENTD_RETRY_LIMIT}
  retry_wait ${FLUENTD_RETRY_WAIT}
  num_threads ${FLUENTD_FLUSH_THREADS}
EOF

cat << 'EOF' >> /etc/fluent/fluent.conf
</match>
EOF

exec fluentd
