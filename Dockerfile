FROM fabric8/fluentd:0.12.6

MAINTAINER Jimmi Dyson <jimmidyson@gmail.com>

RUN apk-install curl-dev

RUN gem install fluent-plugin-kubernetes fluent-plugin-forest fluent-plugin-elasticsearch

ADD start-fluentd /start-fluentd

CMD ["/start-fluentd"]
