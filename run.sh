if [ -f /etc/collectd/collectd.conf.tpl ]; then
  for template in /etc/collectd/collectd.conf.tpl /etc/collectd/collectd.d/*.tpl; do envtpl $template; done
fi
exec collectd -f
