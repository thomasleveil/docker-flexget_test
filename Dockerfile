FROM      ubuntu:trusty
MAINTAINER	Thomas LEVEIL <thomasleveil@gmail.com>

## setup APT
RUN sed -i '1ideb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse' /etc/apt/sources.list
RUN sed -i '1ideb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse' /etc/apt/sources.list
RUN sed -i '1ideb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse' /etc/apt/sources.list
RUN sed -i '1ideb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse' /etc/apt/sources.list
RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y python git

WORKDIR /
RUN git clone https://github.com/Flexget/Flexget.git
ADD https://pypi.python.org/packages/source/p/pip/pip-1.4.1.tar.gz /Flexget/pip-1.4.1.tar.gz
ADD https://pypi.python.org/packages/source/s/setuptools/setuptools-1.1.7.tar.gz /Flexget/setuptools-1.1.7.tar.gz

WORKDIR /Flexget
RUN python bootstrap.py
RUN bin/pip install -r jenkins-requirements.txt
RUN bin/pip install -r rtd-requirements.txt

ADD run_tests.sh /

ENTRYPOINT ["/bin/bash"]
CMD ["/run_tests.sh"]

