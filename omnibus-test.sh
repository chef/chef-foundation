#!/bin/bash
set -ueo pipefail

# We don't want to add the embedded bin dir to the main PATH as this
# could mask issues in our binstub shebangs.
export EMBEDDED_BIN_DIR="/opt/chef/embedded/bin"

# If we are on Mac our symlinks are located under /usr/local/bin
# otherwise they are under /usr/bin
if [[ -f /usr/bin/sw_vers ]]; then
  export USR_BIN_DIR="/usr/local/bin"
else
  export USR_BIN_DIR="/usr/bin"
fi

# Ensure the calling environment (disapproval look Bundler) does not
# infect our Ruby environment created by the `chef-client` cli.
for ruby_env_var in _ORIGINAL_GEM_PATH \
                    BUNDLE_BIN_PATH \
                    BUNDLE_GEMFILE \
                    GEM_HOME \
                    GEM_PATH \
                    GEM_ROOT \
                    RUBYLIB \
                    RUBYOPT \
                    RUBY_ENGINE \
                    RUBY_ROOT \
                    RUBY_VERSION \
                    BUNDLER_VERSION

do
  unset $ruby_env_var
done

# Exercise various packaged tools to validate binstub shebangs
"$EMBEDDED_BIN_DIR/ruby" --version
"$EMBEDDED_BIN_DIR/gem" --version
"$EMBEDDED_BIN_DIR/bundle" --version
"$EMBEDDED_BIN_DIR/nokogiri" --version

echo "======== OpenSSL version"
"$EMBEDDED_BIN_DIR/openssl" version

"$EMBEDDED_BIN_DIR/ruby" -r openssl -e 'puts "Ruby can load OpenSSL"'

if [ "$OMNIBUS_FIPS_MODE" = "true" ]
then
  export OPENSSL_FIPS=1
  echo "FIPS is enabled, checking FIPS mode"
  ls -l /opt/chef/embedded/ssl/fipsmodule.cnf
  ls -l /opt/chef/embedded/lib/ossl-modules/fips.so
  echo "openssl.cnf:"
  cat /opt/chef/embedded/ssl/openssl.cnf
  echo "fipsmodule.cnf:"
  cat /opt/chef/embedded/ssl/fipsmodule.cnf

  echo ":closed_lock_with_key: Checking FIPS mode"
  export OPENSSL_FIPS=1
  "$EMBEDDED_BIN_DIR/openssl" md5 < ./LICENSE
  if [ $? -eq 0 ]
  then
    echo "FIPS validation failed--md5 should not be available in FIPS mode"
  fi
  echo "Checking the rubies available"
  find /opt -name 'ruby' -perm /111 -exec {} -v -e "puts \"{}\"; require 'openssl'; OpenSSL.fips_mode = 1" \;
else
  echo "FIPS is not enabled, skipping FIPS mode functionality test"
fi