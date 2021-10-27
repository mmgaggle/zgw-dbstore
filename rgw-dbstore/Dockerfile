FROM centos:centos8
USER root

RUN dnf install -y bzip2
RUN curl -O http://rht-sbu.s3.amazonaws.com/notrados.tar.bz2 
RUN tar xvjf notrados.tar.bz2
COPY entrypoint.sh /bin/entrypoint.sh


