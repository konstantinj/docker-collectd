#!/bin/bash
set -e

if [ ! -f /usr/share/collectd/types.db ]; then
  mv /etc/collectd/docker.types.db /usr/share/collectd/types.db
fi

if [ -f /etc/collectd/collectd.conf.tpl ]; then
  envtpl /etc/collectd/collectd.conf.tpl
fi

tpls=$(shopt -s nullglob dotglob; echo /etc/collectd/collectd.d/*.tpl)
if (( ${#tpls} )); then
  for tpl in ${tpls}; do
    envtpl ${tpl}
  done
fi

exec collectd -f
