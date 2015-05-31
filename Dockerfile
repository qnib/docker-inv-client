FROM qnib/terminal
MAINTAINER "Christian Kniep <christian@qnib.org>"

RUN yum install -y http://mirror.imt-systems.com/epel/7/x86_64/e/epel-release-7-5.noarch.rpm \
                   https://osquery-packages.s3.amazonaws.com/centos7/osquery-1.4.5.rpm
RUN cd /tmp/ && \
    wget -q https://github.com/osquery/osquery-python/archive/master.zip && \
    unzip master.zip && cd osquery-python-master && \
    python setup.py install && cd /tmp/ && \
    rm -rf master.zip osquery-python-master
ADD data/ /data/
