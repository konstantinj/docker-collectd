FROM alpine
MAINTAINER Konstantin Jakobi <konstantin.jakobi@gmail.com>

RUN apk add -U git wget collectd collectd-dev collectd-curl collectd-rrdtool collectd-write_http py-pip btrfs-progs \
 && rm -rf /var/cache/apk/*

RUN git clone https://github.com/lebauce/docker-collectd-plugin.git /share/docker-collectd-plugin \
 && pip install -r /share/docker-collectd-plugin/requirements.txt
RUN wget -O /etc/collectd/types.db https://raw.githubusercontent.com/collectd/collectd/master/src/types.db
RUN pip install envtpl

ADD collectd.conf.tpl /etc/collectd/collectd.conf.tpl
ADD collectd.d /etc/collectd/collectd.d

CMD for template in /etc/collectd/collectd.conf.tpl /etc/collectd/collectd.d/*.tpl ; do envtpl $template ; done && exec collectd -f
