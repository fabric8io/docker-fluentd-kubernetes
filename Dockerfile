FROM fabric8/fluentd:0.14.0.pre.1

MAINTAINER Jimmi Dyson <jimmidyson@gmail.com>

RUN yum install -y gcc-c++

RUN scl enable rh-ruby22 'gem install fluent-plugin-kubernetes_metadata_filter \
                                      fluent-plugin-elasticsearch \
                                      fluent-plugin-remote_syslog' && \
    scl enable rh-ruby22 'gem cleanup fluentd'

RUN mkdir /etc/fluent
COPY fluent.conf /etc/fluent/fluent.conf
COPY start-fluentd /start-fluentd

ENTRYPOINT ["/start-fluentd"]
