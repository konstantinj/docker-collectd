# Collectd with Docker

**Collectd** container with [docker-collectd-plugin](https://github.com/bobrik/collectd-docker).

This uses the **Docker API** to report stats for each container on the host.

The following container stats are reported:

- Network bandwidth
- Memory usage
- CPU usage

Metric names look like this:

> collectd.<host>.docker_stats.<app>.<task>.<type>.<metric>

Collectd is configured to send data via network plugin to NETWORK_HOST:NETWORK_PORT..

## Usage

```bash
sudo docker run \
  --volume=/var/run/docker.sock:/var/run/docker.sock \
  --env HOSTNAME=localhost \
  --env NETWORK_HOST=e.g. logstash \
  --env NETWORK PORT=e.g. 25826 \
  konjak/docker-collectd
```
