FROM fabric8/fluentd:0.12.16

MAINTAINER Jimmi Dyson <jimmidyson@gmail.com>

RUN apk add --update curl-dev && \
    rm -rf /var/cache/apk/*

RUN gem install fluent-plugin-kubernetes_metadata_filter \
                fluent-plugin-forest \
                fluent-plugin-elasticsearch

ENV ES_HOST es-logging.default.svc.cluster.local
ENV ES_PORT 9200

ADD fluent.conf /etc/fluent/fluent.conf
