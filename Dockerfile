FROM debian:bookworm-slim

LABEL org.opencontainers.image.source="https://github.com/jgamblin/tcpdump"
LABEL org.opencontainers.image.description="Lightweight tcpdump container for network packet capture"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.authors="Jerry Gamblin"

# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install -y --no-install-recommends tcpdump && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /pcap && \
    adduser --disabled-password --gecos "" --uid 1000 captureuser && \
    chown captureuser:captureuser /pcap

WORKDIR /pcap

USER captureuser

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD pgrep tcpdump || exit 1

CMD ["tcpdump", "-G", "900", "-w", "%Y-%m-%d_%H:%M:%S.pcap", "-W", "96"]
