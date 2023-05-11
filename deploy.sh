#!/bin/bash
pkill -f puma
sudo apt update && sudo apt upgrade -y
sudo apt-get install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit
sudo systemctl start mongod
sudo systemctl enable mongod
bundle install
puma -d
