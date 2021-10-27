FROM centos:centos8
USER root

RUN dnf install -y cargo
RUN cargo install s3d
COPY entrypoint.sh /bin/entrypoint.sh
