FROM qnib/terminal
MAINTAINER "Christian Kniep <christian@qnib.org>"

RUN yum install -y http://mirror.imt-systems.com/epel/7/x86_64/e/epel-release-7-5.noarch.rpm \
                   https://osquery-packages.s3.amazonaws.com/centos7/osquery-1.4.5.rpm
RUN cd /tmp/ && \
    wget -q https://github.com/thepauleh/osquery-python/archive/master.zip && \
    unzip master.zip && cd osquery-python-master && \
    mv osquery-python/osquery.py /usr/lib/python2.7/site-packages/ && \
    cd /tmp/ && rm -rf master.zip osquery-python-master
ADD data/ /data/
