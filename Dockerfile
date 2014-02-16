FROM      ubuntu:12.10
MAINTAINER	Thomas LEVEIL <thomasleveil@gmail.com>

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu quantal main universe" > /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y python git

WORKDIR /
RUN git clone https://github.com/Flexget/Flexget.git
ADD https://pypi.python.org/packages/source/p/pip/pip-1.4.1.tar.gz /Flexget/pip-1.4.1.tar.gz
ADD https://pypi.python.org/packages/source/s/setuptools/setuptools-1.1.7.tar.gz /Flexget/setuptools-1.1.7.tar.gz
ADD run_tests.sh /

WORKDIR /Flexget
RUN python bootstrap.py
RUN bin/pip install -r jenkins-requirements.txt
RUN bin/pip install -r rtd-requirements.txt

ENTRYPOINT ["/bin/bash"]
CMD ["/run_tests.sh"]

