source "https://rubygems.org"

gem "omnibus", github: ENV.fetch("OMNIBUS_GITHUB_REPO", "chef/omnibus"), ref: "5bc091ab3ed4ab002ef85dad3923914c25bb3dcd"

gem "omnibus-software", github: ENV.fetch("OMNIBUS_SOFTWARE_GITHUB_REPO", "chef/omnibus-software"), ref: "a63bd71702f5bf350ca17ee0726ac36fc418d54e"

gem "artifactory"

gem "pedump"

gem "chefstyle"

# This development group is installed by default when you run `bundle install`,
# but if you are using Omnibus in a CI-based infrastructure, you do not need
# the Test Kitchen-based build lab. You can skip these unnecessary dependencies
# by running `bundle config set --local without development && bundle install` to speed up build times.
group :development do
  # Use Berkshelf for resolving cookbook dependencies
  gem "berkshelf", "~> 7.0"

  # Use Test Kitchen with Vagrant for converging the build environment
  gem "test-kitchen", ">= 1.23"
  gem "kitchen-vagrant", ">= 1.3.1"
  gem "winrm-fs", "~> 1.0"
end

group :test do
  gem "rake"
end