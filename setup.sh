#!/bin/bash

set -euo pipefail

sudo apt-get install software-properties-common
sudo apt-get -y install libpq-dev

\curl -sSL https://get.rvm.io | bash -s stable --auto-dotfiles
echo progress-bar >> ~/.curlrc
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
rvm install ruby-2.2.1
bundle install

RAILS_ENV=development rake db:migrate
rake db:seed

rails server
