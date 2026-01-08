#!/bin/bash
#
# This script runs a passed in command, but first setups up the bundler caching on the repo

set -ue

export USER="root"
export LANG=C.UTF-8 LANGUAGE=C.UTF-8

echo "--- bundle install"

if [ "${OMNIBUS_FIPS_MODE-false}" = "true" ]; then
  export OPENSSL_FIPS=1
fi

bundle config --local path vendor/bundle
bundle config set --local without development
bundle install --ful-index --jobs=7 --retry=3

echo "+++ bundle exec task"
bundle exec $@