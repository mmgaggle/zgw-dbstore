FROM quay.io/centos/centos:stream8

USER root
RUN dnf install -y python3-virtualenv python36-devel libevent-devel libffi-devel libxml2-devel libxslt-devel zlib-devel git gcc
RUN dnf groupinstall -y 'development tools'
ENV PIP_ROOT_USER_ACTION=ignore

WORKDIR /opt
RUN git clone https://github.com/ceph/s3-tests
WORKDIR /opt/s3-tests
RUN pip3 install -r requirements.txt
