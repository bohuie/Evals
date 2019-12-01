#!/bin/bash

set -euo pipefail

export TERM=xterm

yarn --color=always wait-on http://localhost:3000

yarn --color=always cypress run --project ./spec --config trashAssetsBeforeRuns=true,baseUrl=http://localhost:3000

yarn --color=always cypress run --project ./spec --browser chrome  --config trashAssetsBeforeRuns=true,baseUrl=http://localhost:3000
