FROM alpine
MAINTAINER Konstantin Jakobi <konstantin.jakobi@gmail.com>

RUN apk add -U bash git wget collectd collectd-dev collectd-curl collectd-rrdtool py-pip \
 && rm -rf /var/cache/apk/*

RUN wget -O /collector https://github.com/bobrik/collectd-docker/releases/download/0.4.1/collectd-docker.amd64 \
 && chmod 6755 /collector \
 && wget -O /etc/collectd/types.db https://raw.githubusercontent.com/collectd/collectd/master/src/types.db \
 && pip install envtpl

ADD types.db /etc/collectd/docker.types.db
ADD collectd.conf.tpl /etc/collectd/collectd.conf.tpl
ADD collectd.d /etc/collectd/collectd.d
ADD run.sh /run.sh

CMD /run.sh
