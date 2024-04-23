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
echo ":ruby: Validating Ruby can run"
"$EMBEDDED_BIN_DIR/ruby" --version
echo ":gem: Validating RubyGems can run"
"$EMBEDDED_BIN_DIR/gem" --version
echo ":bundler: Checking Bundler version"
"$EMBEDDED_BIN_DIR/bundle" --version
echo ":carpentry_saw: Checking nokogiri version"
"$EMBEDDED_BIN_DIR/nokogiri" --version

"$EMBEDDED_BIN_DIR/ruby" -r openssl -e 'puts "Ruby can load OpenSSL"'

echo ":lock: Checking OpenSSL version"
"$EMBEDDED_BIN_DIR/openssl" version # ensure openssl command works

if [ "$OMNIBUS_FIPS_MODE" = "true" ]
then
  echo "FIPS is enabled, checking FIPS mode functionality"
  echo ":closed_lock_with_key: Checking FIPS mode"
  export OPENSSL_FIPS=1
  openssl dgst -sha256 < ./LICENSE
  if [ $? -eq 0 ]
  then
    echo "FIPS mode validation succeeded with SHA-256"
  else
    openssl dgst -sha3-256 < ./LICENSE
    if [ $? -eq 0 ]
    then
      echo "FIPS mode validation succeeded with SHA-3 (SHA3-256)"
    else
      echo "FIPS validation failed--neither SHA-256 nor SHA-3 (SHA3-256) available in FIPS mode"
    fi
  fi
else
  echo "FIPS is not enabled, skipping FIPS mode functionality test"
fi
