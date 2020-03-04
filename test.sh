#!/bin/bash

set -euo pipefail

export TERM=xterm

bundle exec rake

rm -rf ./spec/cypress/reports/* || true

yarn --color=always wait-on http://localhost:3000

yarn --color=always cypress run --project ./spec --browser chrome  --config trashAssetsBeforeRuns=true,baseUrl=http://localhost:3000

BROWSER=chrome ./report
