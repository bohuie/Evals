#!/bin/bash

bundle update
yarn upgrade
bundle exec rake

echo "Updgrade complete.  You should run the tests by executing ./test.sh"