#!/bin/bash

set -euo pipefail

export TERM=xterm

RAILS_ENV=test rake assets:precompile

(bin/rails server -e test -p 5002 > /dev/null) &
yarn --color=always wait-on http://localhost:5002

rm db/test.sqlite3 || true
RAILS_ENV=test bin/rake db:create db:migrate db:seed
yarn --color=always cypress run --project ./spec --config video=false,trashAssetsBeforeRuns=true

rm db/test.sqlite3 || true
RAILS_ENV=test bin/rake db:create db:migrate db:seed
yarn --color=always cypress run --project ./spec --browser chrome  --config video=false,trashAssetsBeforeRuns=true

trap 'kill $(jobs -p)' EXIT
