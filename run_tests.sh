#!/bin/bash

cd /Flexget

git reset --hard HEAD
git pull origin master

source bin/activate
pip install -r jenkins-requirements.txt --upgrade
pip install -r rtd-requirements.txt --upgrade

pip freeze
nosetests --attr='!online'

