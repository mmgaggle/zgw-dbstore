FROM quay.io/ceph/daemon:latest-master-devel
USER root


RUN pip3 install s3cmd 
COPY warp /bin/
COPY entrypoint.sh /opt/ceph-container/bin/
COPY ceph.conf /etc/ceph/ceph.conf
