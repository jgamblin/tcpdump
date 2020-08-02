# TCPDUMP
A container that runs TCP dump.
[More Details On My Blog](https://jerrygamblin.com/2016/05/28/a-docker-container-to-capture-all-traffic-from-host/)

### Easy Run: 
`docker run -v ~/pcap:/pcap --net=host -d jgamblin/tcpdump`

### Github Actions: 
![Change Build](https://github.com/jgamblin/tcpdump/workflows/Change%20Build/badge.svg)
![Hourly Build](https://github.com/jgamblin/tcpdump/workflows/Hourly%20Build/badge.svg)
![Dockerfile Lint](https://github.com/jgamblin/tcpdump/workflows/Dockerfile%20Lint/badge.svg)
