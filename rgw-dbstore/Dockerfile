FROM quay.io/ceph/daemon:latest-master-devel
USER root

RUN curl -LO https://github.com/peak/s5cmd/releases/download/v2.0.0/s5cmd_2.0.0_Linux-64bit.tar.gz 
RUN curl -LO https://github.com/minio/warp/releases/download/v0.6.2/warp_0.6.2_Linux_x86_64.tar.gz
RUN tar xvzf s5cmd_2.0.0_Linux-64bit.tar.gz
RUN tar xvzf warp_0.6.2_Linux_x86_64.tar.gz
RUN mv s5cmd /bin/
RUN mv warp /bin/
RUN mkdir -p /root/.aws

COPY mb.py /bin/
COPY entrypoint.sh /opt/ceph-container/bin/
COPY ceph.conf /etc/ceph/ceph.conf
