#!/bin/sh

bin/rake db:migrate
bin/rails server -b 0.0.0.0 -p $PORT
