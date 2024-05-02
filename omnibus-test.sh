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
"$EMBEDDED_BIN_DIR/ruby" -r openssl -e "puts OpenSSL::VERSION"