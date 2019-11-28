#!/bin/bash

set -euo pipefail

sudo apt-get install software-properties-common
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get -y update
sudo apt-get -y install rvm
sudo apt-get -y install libpq-dev
