# THIS IS NOW HAND MANAGED, JUST EDIT THE THING
# keep it machine-parsable since CI uses it
#
#
# NOTE: You MUST update omnibus-software when adding new versions of
# software here: bundle exec rake dependencies:update_omnibus_gemfile_lock
override "libffi", version: "3.4.2"
override "libiconv", version: "1.16"
override "liblzma", version: "5.2.5"
override "libtool", version: "2.4.2"
override "libarchive", version: "3.6.1"

if solaris?
  # Chef Infra Client failed to install on Solaris V11.4.47 - CHEF-7695
  override :bash, version: "5.1.8"
end
override "libyaml", version: "0.1.7"
override "makedepend", version: "1.0.5"
override "ncurses", version: "6.3"
override "nokogiri", version: "1.13.6"
# if you need to calculate openssl environment
openssl_version_default =
  case
#  when windows?
#    "1.0.2zi"
  when macos?
    "1.1.1m"
  else
    "3.0.9"
  end

# set OPENSSL_OVERRIDE variable to a different openssl version to test
# builds for other versions in omnibus_software
override "openssl", version: ENV.fetch("OPENSSL_OVERRIDE", openssl_version_default)
override "pkg-config-lite", version: "0.28-1"
override :ruby, version: aix? ? "3.0.3" : ENV.fetch("RUBY_OVERRIDE", "3.1.6"), openssl_gem: "3.2.0"
override "ruby-windows-devkit-bash", version: "3.1.23-4-msys-1.0.18"
override "ruby-msys2-devkit", version: ENV.fetch("MSYS_OVERRIDE", "3.1.6-1")
override "util-macros", version: "1.19.0"
override "xproto", version: "7.0.28"
override "zlib", version: "1.2.11"
