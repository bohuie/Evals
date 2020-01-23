#!/bin/sh

bin/rake db:migrate
bundle exec puma -C config/puma.rb
