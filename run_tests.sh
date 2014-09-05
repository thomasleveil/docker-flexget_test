#!/bin/bash
set -e
pip freeze

cat <<EOF


============== updating Flexget =================
EOF
cd /Flexget
git checkout develop
git reset --hard HEAD

cat <<EOF


================ running tests ===================
EOF
echo "nosetests $*"
nosetests $*

