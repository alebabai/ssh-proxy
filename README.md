# SSH-proxy

> Dockerized ssh-proxy powered by OpenSSH

[![](https://images.microbadger.com/badges/image/alebabai/ssh-proxy.svg)](https://microbadger.com/images/alebabai/ssh-proxy "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/alebabai/ssh-proxy.svg)](https://microbadger.com/images/alebabai/ssh-proxy "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/license/alebabai/ssh-proxy.svg)](https://microbadger.com/images/alebabai/ssh-proxy "Get your own license badge on microbadger.com")

## Usage

### Environment variables

- `ADDRESSES` - _provide one or more `HOST:PORT` pairs separated by space for services to be exposed_
- `OUTPUT_FILE` - _prefix of the exposed url (default `$timestamp`)_
- `SSH_TUNNEL_HOST` - _host of the service that will be used as ssh-server (default `serveo.net`)_
- `SSH_TUNNEL_PORT` - _port of the service that will be used as ssh-server (default `443`)_
- `SSH_TUNNEL_PREFIX` - _name of the file with exposed urls (default `/tmp/ssh-proxy/output.txt`)_

### Docker

Here is docker-compose example configuration [`docker-compose.example.yml`](docker-compose.example.yml).
