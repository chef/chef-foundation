if ENV.fetch("OMNIBUS_USE_INTERNAL_SOURCES", false)
  source "https://artifactory-internal.ps.chef.co/artifactory/rubygems-proxy"
else
  source "https://rubygems.org"
end

# gem "omnibus", "~> 9.0.11"
gem "omnibus", github: "chef/omnibus", branch: "gcs-devel/customize-zip-command"

gem "omnibus-software", "~> 22.11"

gem "artifactory"

gem "pedump"

gem "chefstyle"

# This development group is installed by default when you run `bundle install`,
# but if you are using Omnibus in a CI-based infrastructure, you do not need
# the Test Kitchen-based build lab. You can skip these unnecessary dependencies
# by running `bundle config set --local without development && bundle install` to speed up build times.
group :development do
  # Use Berkshelf for resolving cookbook dependencies
  gem "berkshelf", ">= 8.0"

  # Use Test Kitchen with Vagrant for converging the build environment
  gem "test-kitchen", ">= 1.23"
  gem "kitchen-vagrant", ">= 1.3.1"
  gem "winrm-fs", "~> 1.0"
end

group :test do
  gem "rake"
end