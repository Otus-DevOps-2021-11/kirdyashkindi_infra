#!/bin/bash

apt-get install -y git

#cd /home/appuser
git clone -b monolith https://github.com/express42/reddit.git

cd reddit
bundle install
