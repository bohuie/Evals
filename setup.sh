#/usr/bin/env bash

set -euo pipefail

# TODO: Install asdf - https://asdf-vm.com/#/
if ! asdf plugin-list | grep ruby > /dev/null; then
    asdf plugin-add ruby
fi

asdf install
bundle install