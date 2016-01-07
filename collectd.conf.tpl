Hostname "{{ HOSTNAME }}"

FQDNLookup false
Interval 10
Timeout 3
ReadThreads 5
WriteThreads 5

TypesDB "/etc/collectd/types.db"
TypesDB "/usr/share/collectd/types.db"

LoadPlugin cpu
LoadPlugin df
LoadPlugin disk
LoadPlugin interface
LoadPlugin load
LoadPlugin memory
LoadPlugin processes
LoadPlugin swap
LoadPlugin uptime

LoadPlugin exec
<Plugin exec>
  Exec "nobody" "/collector" "-endpoint" "unix:///var/run/docker.sock" "-host" "{{ HOSTNAME }}" "-interval" "10"
</Plugin>

LoadPlugin network
<Plugin network>
    <Server "{{ NETWORK_HOST | default("logstash") }}" "{{ NETWORK_PORT | default(25826) }}">
    </Server>
</Plugin>

Include "/etc/collectd/collectd.d/*.conf"
