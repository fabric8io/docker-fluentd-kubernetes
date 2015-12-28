# Fluentd Log Collector For Kubernetes

This image captures logs from Docker containers,
enriches with Kubernetes metadata & pushes to the
specified Elasticsearch service deployed in your
Kubernetes environment.

You can configure behaviour via the following environment
variables:

* `ELASTICSEARCH_HOST` - the Elasticsearh host name to send data to
(default: `es-logging.default.svc`)
* `ELASTICSEARCH_PORT` - the Elasticsearh port to send data to
(default: `9200`)
* `ELASTICSEARCH_SCHEME` - `http` or `https` (default: `http`)
* `ELASTICSEARCH_USER` - user to connect with
* `ELASTICSEARCH_PASSWORD` - password to connect with
* `FLUENTD_FLUSH_INTERVAL` - how often to flush fluentd data
(default: `10s`)
* `FLUENTD_FLUSH_THREADS` - number of threads to use to flush
logs (default: `1`)
* `FLUENTD_RETRY_LIMIT` - number of retries on flush failures
(default: `10`)
* `FLUENTD_DISABLE_RETRY_LIMIT` - disable retry limit (default: `true`)
* `FLUENTD_RETRY_WAIT` - time to wait between retries (default:
`1s`)
* `FLUENTD_MAX_RETRY_WAIT` - maximum time to wait between retries (default:
`60s`)
* `FLUENTD_BUFFER_CHUNK_LIMIT` - max buffer chunk size (default:
`8m`)
* `FLUENTD_BUFFER_QUEUE_LIMIT` - max buffer queue size (default:
`8192`)
* `FLUENTD_BUFFER_TYPE` - buffer type: `memory` or `file`
(default: `memory`)
* `FLUENTD_BUFFER_PATH` - buffer file path if using a `file`
buffer (default: `/var/fluentd/buffer`)
* `FLUENTD_LOGSTASH_FORMAT` - use logstash format (default `true`)

For more information on Fluentd buffer plugins & options, see
http://docs.fluentd.org/articles/buffer-plugin-overview.
