FROM python:2
RUN pip install paver

RUN git clone -b develop https://github.com/Flexget/Flexget.git /Flexget
WORKDIR /Flexget
RUN pip install -r jenkins-requirements.txt
RUN pip install .

ADD run_tests.sh /
RUN chmod +x /run_tests.sh
ENTRYPOINT ["/run_tests.sh"]
CMD ["--attr", "!online"]

