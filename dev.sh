#!/bin/bash

set -euo pipefail

rm -rf db/*.sqlite3

RAILS_ENV=development rake db:migrate
rake db:seed
rails server
