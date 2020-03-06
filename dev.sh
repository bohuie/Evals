#!/bin/bash

set -euo pipefail

rm -rf db/*.sqlite3

export RAILS_ENV=development
export RAKE_ENV=development
bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec puma -C config/puma.rb
