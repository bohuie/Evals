#!/bin/bash

set -euo pipefail

export TERM=xterm
bundle exec rake assets:precompile

(bin/rails server -p $PORT > /dev/null) &
yarn --color=always wait-on http://localhost:$PORT

yarn --color=always cypress run --project ./spec --config video=false,trashAssetsBeforeRuns=true,baseUrl=http://localhost:$PORT

yarn --color=always cypress run --project ./spec --browser chrome  --config video=false,trashAssetsBeforeRuns=true,baseUrl=http://localhost:$PORT

trap 'kill $(jobs -p)' EXIT
