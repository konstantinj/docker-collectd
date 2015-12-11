Hostname "{{HOSTNAME}}"

FQDNLookup false
Interval 10
Timeout 2
ReadThreads 5
WriteThreads 5

LoadPlugin cpu
LoadPlugin disk
LoadPlugin interface
LoadPlugin load
LoadPlugin memory

TypesDB "/etc/collectd/types.db"
TypesDB "/share/docker-collectd-plugin/dockerplugin.db"

LoadPlugin network

<Plugin network>
    <Server "NETWORK_HOST" "NETWORK_PORT">
    </Server>
</Plugin>

LoadPlugin python
<Plugin python>
  ModulePath "/share/docker-collectd-plugin"
  Import "dockerplugin"

  <Module dockerplugin>
    BaseURL "unix://var/run/docker.sock"
    Timeout 3
  </Module>
</Plugin>
