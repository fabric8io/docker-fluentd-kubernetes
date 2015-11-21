FROM fabric8/fluentd:0.14.0.pre.1

MAINTAINER Jimmi Dyson <jimmidyson@gmail.com>

ENTRYPOINT ["/start-fluentd"]

ENV ELASTICSEARCH_HOST es-logging.default.svc

RUN yum install -y gcc-c++

RUN scl enable rh-ruby22 'gem install fluent-plugin-kubernetes_metadata_filter \
                                      fluent-plugin-elasticsearch' && \
    scl enable rh-ruby22 'gem cleanup fluentd'

ADD start-fluentd /start-fluentd
