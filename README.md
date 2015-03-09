# Fluentd Log Collector For Kubernetes

This image captures logs from Docker containers,
enriches with Kubernetes metadata & pushes to the
specified Elasticsearch service deployed in your
Kubernetes environment.

You can configure behaviour via the following environment
variables:

* `ELASTICSEARCH_SERVICE_NAME` - the name of the Kubernetes
service to send data to (default: `ELASTICSEARCH`)
* `ELASTICSEARCH_SCHEME` - `http` or `https`
* `ELASTICSEARCH_USER` - user to connect with
* `ELASTICSEARCH_PASSWORD` - password to connect with
* `FLUENTD_FLUSH_INTERVAL` - how often to flush fluentd data
(default: `60s`)
* `FLUENTD_FLUSH_THREADS` - number of threads to use to flush
logs (default: `1`)
* `FLUENTD_RETRY_LIMIT` - number of retries on flush failures
(default: `10`)
* `FLUENTD_RETRY_WAIT` - time to wait between retries (default:
`1s`)
* `FLUENTD_BUFFER_CHUNK_LIMIT` - max buffer chunk size (default:
`8m`)
* `FLUENTD_BUFFER_QUEUE_LIMIT` - max buffer queue size (default:
`256`)
* `FLUENTD_BUFFER_TYPE` - buffer type: `memory` or `file`
(default: `memory`)
* `FLUENTD_BUFFER_PATH` - buffer file path if using a `file`
buffer (default: `/var/fluentd/buffer`)

For more information on Fluentd buffer plugins & options, see
http://docs.fluentd.org/articles/buffer-plugin-overview.
