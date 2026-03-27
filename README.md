# tcpdump

Lightweight container for network packet capture using tcpdump. Captures traffic in rotating 15-minute PCAP files.

[![Build and Push](https://github.com/jgamblin/tcpdump/actions/workflows/build.yml/badge.svg)](https://github.com/jgamblin/tcpdump/actions/workflows/build.yml)
[![Lint](https://github.com/jgamblin/tcpdump/actions/workflows/lint.yml/badge.svg)](https://github.com/jgamblin/tcpdump/actions/workflows/lint.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## Run

```bash
docker run -v ~/pcap:/pcap --net=host -d jgamblin/tcpdump
```

By default captures all traffic in 15-minute rotating files (96 max = 24 hours), saved to `/pcap`.

## Custom Capture

Override the default command to customize:

```bash
# Capture only port 443 traffic
docker run -v ~/pcap:/pcap --net=host -d jgamblin/tcpdump tcpdump -i any port 443 -G 900 -w '%Y-%m-%d_%H:%M:%S.pcap' -W 96

# Capture with verbose output
docker run -v ~/pcap:/pcap --net=host -it jgamblin/tcpdump tcpdump -v
```

## Build

```bash
docker build -t tcpdump .
docker run -v ~/pcap:/pcap --net=host -d tcpdump
```

## Security Notes

- Runs as non-root user `captureuser` (UID 1000)
- Requires `--net=host` for host network capture
- PCAP files are written to `/pcap` — mount a volume to persist

## License

[MIT](LICENSE)
