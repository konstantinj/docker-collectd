# Collectd Docker iamge for Docker monitoring

[![](https://badge.imagelayers.io/konjak/collectd:latest.svg)](https://imagelayers.io/?images=konjak/collectd:latest)

Production ready Docker container for collectd with [docker-collectd-plugin](https://github.com/bobrik/collectd-docker) for docker container monitoring.

This uses the Docker API to report stats for each container on the host.

The following container stats are reported:

- Network bandwidth
- Memory usage
- CPU usage

Metric names look like this:

```
collectd.<host>.docker_stats.<app>.<task>.<type>.<metric>
```

Collectd is configured to send data via network plugin to NETWORK_HOST:NETWORK_PORT.

## Usage

```bash
sudo docker run \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e HOSTNAME=localhost \
  -e NETWORK_HOST=e.g. logstash \
  -e NETWORK PORT=e.g. 25826 \
  konjak/collectd
```

## Status

Production stable.
