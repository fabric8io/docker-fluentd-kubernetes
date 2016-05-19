FROM fabric8/fluentd:0.14.0.pre.1

MAINTAINER Jimmi Dyson <jimmidyson@gmail.com>

ENTRYPOINT ["/start-fluentd"]

ENV ELASTICSEARCH_HOST es-logging.default.svc

RUN touch /var/lib/rpm/* && yum install -y gcc-c++ && yum clean all

RUN scl enable rh-ruby22 'gem install --no-document fluent-plugin-kubernetes_metadata_filter -v 0.21.0' && \
    scl enable rh-ruby22 'gem install --no-document fluent-plugin-elasticsearch -v 1.5.0' && \
    scl enable rh-ruby22 'gem cleanup fluentd'

ADD start-fluentd /start-fluentd
