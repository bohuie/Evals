#!/bin/bash

set -euo pipefail

RAILS_ENV=test rake assets:precompile

(bin/rails server -e test -p 5002 > /dev/null) &
yarn wait-on http://localhost:5002

rm db/test.sqlite3 || true
RAILS_ENV=test bin/rake db:create db:migrate
yarn cypress run --project ./spec

rm db/test.sqlite3 || true
RAILS_ENV=test bin/rake db:create db:migrate
yarn cypress run --project ./spec --browser chrome

trap 'kill $(jobs -p)' EXIT
