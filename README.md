# Collectd with Docker

**Collectd** container with [docker-collectd-plugin](https://github.com/lebauce/docker-collectd-plugin).

This uses the **Docker API** to report stats for each container on the host.

The following container stats are reported:

- Network bandwidth
- Memory usage
- CPU usage
- Block IO

The name of the container is used for the `plugin_instance` dimension.

Collectd is configured to send data via network plugin to NETWORK_HOST:NETWORK_PORT..

## Usage

```bash
sudo docker run \
  --volume=/var/run/docker.sock:/var/run/docker.sock \
  --env NETWORK_HOST=e.g. logstash \
  --env NETWORK PORT=e.g. 25826 \
  konstantinj/docker-collectd
```
