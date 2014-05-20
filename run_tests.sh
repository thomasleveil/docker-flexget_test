#!/bin/bash
cd /Flexget
git checkout develop
git reset --hard HEAD
source bin/activate
pip freeze
nosetests --attr='!online' $*

