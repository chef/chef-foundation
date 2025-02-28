source "https://rubygems.org"

gem "omnibus", github: ENV.fetch("OMNIBUS_GITHUB_REPO", "chef/omnibus"), branch: ENV.fetch("OMNIBUS_GITHUB_BRANCH", "testmac12/muthuja")

gem "omnibus-software", github: ENV.fetch("OMNIBUS_SOFTWARE_GITHUB_REPO", "chef/omnibus-software"), branch: ENV.fetch("OMNIBUS_SOFTWARE_GITHUB_BRANCH", "main")

gem "artifactory"

gem "pedump"

gem "cookstyle"

# This is to help patch in openssl for Ruby 3.0.x, since Ruby 3.0 uses OpenSSL <3.0
# unless you build without and reintroduce it manually.
# Remove once we're no longer supporting Ruby 3.0.x.
# Also, fips_mode may need it
gem "openssl", "= 3.2.0"

# This development group is installed by default when you run `bundle install`,
# but if you are using Omnibus in a CI-based infrastructure, you do not need
# the Test Kitchen-based build lab. You can skip these unnecessary dependencies
# by running `bundle config set --local without development && bundle install` to speed up build times.
group :development do
  # Use Berkshelf for resolving cookbook dependencies
  gem "berkshelf", ">= 8.0"

  # Use Test Kitchen with Vagrant for converging the build environment
  gem "test-kitchen", ">= 1.23", "< 3.6"
  gem "kitchen-vagrant", ">= 1.3.1"
  gem "winrm-fs", "~> 1.0"
end

group :test do
  gem "rake"
end
