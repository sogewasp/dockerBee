FROM docker.io/ubuntu:xenial
MAINTAINER 2lfa
RUN apt update && apt upgrade -y
RUN apt install -y git python-pip

## Killerbee dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install wireshark python-gtk2 python-cairo python-usb python-crypto python-serial python-dev libgcrypt-dev

RUN cd /root/ && git clone https://github.com/secdev/scapy
RUN cd /root/scapy && python setup.py install

# Killerbee
RUN cd /root/ && git clone https://github.com/riverloopsec/killerbee
RUN cd /root/killerbee && python setup.py install

RUN apt-get clean -y

CMD /bin/bash
