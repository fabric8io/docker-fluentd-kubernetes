FROM fabric8/fluentd:0.14.0.pre.1

MAINTAINER Jimmi Dyson <jimmidyson@gmail.com>

RUN yum install -y gcc-c++

RUN scl enable rh-ruby22 'gem install fluent-plugin-kubernetes_metadata_filter \
                                      fluent-plugin-elasticsearch' && \
    scl enable rh-ruby22 'gem cleanup fluentd'

ENV ES_HOST es-logging.default.svc.cluster.local
ENV ES_PORT 9200

ADD fluent.conf /etc/fluent/fluent.conf
