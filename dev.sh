#!/bin/bash

set -euo pipefail

rm -rf db/*.sqlite3

RAILS_ENV=development bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec rails server
