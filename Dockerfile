FROM ubuntu:16.04

USER root
WORKDIR /root

COPY ENTRYPOINT.sh /

ENV http_proxy 'http://subhrendu:265555@172.16.112.141:3128'
ENV https_proxy 'http://subhrendu:265555@172.16.112.141:3128'
ENV ftp_proxy 'http://subhrendu:265555@172.16.112.141:3128'

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    iproute2 \
    iputils-ping \
    mininet \
    net-tools \
    tcpdump \
    vim \
    x11-xserver-utils \
    xterm \
 && rm -rf /var/lib/apt/lists/* \
 && chmod +x /ENTRYPOINT.sh

EXPOSE 6633 6653 6640

ENTRYPOINT ["/ENTRYPOINT.sh"]
