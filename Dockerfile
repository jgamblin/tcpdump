FROM debian:stable
RUN apt-get update && apt-get install -y \
tcpdump --no-install-recommends && \
rm -rf /var/lib/apt/lists/* 
RUN mkdir /pcap
RUN cd /pcap
WORKDIR /pcap
CMD tcpdump -G 900 -w '%Y-%m-%d_%H:%M:%S.pcap' -W 96