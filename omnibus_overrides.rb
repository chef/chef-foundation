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
  # Chef Infra Cilent failed to install on Solaris V11.4.47 - CHEF-7695
  override :bash, version: "5.1.8"
end
# libxml2 version - 2.10.4 fails on freebsd 13 hence pinned to 2.11.7
if freebsd?
  override :libxml2, version: "2.11.7"
end
override "libyaml", version: "0.1.7"
override "makedepend", version: "1.0.5"
override "ncurses", version: "6.3"
override "nokogiri", version: "1.13.6"
override "openssl", version: mac_os_x? ? "1.1.1m" : "1.0.2zi"
override "pkg-config-lite", version: "0.28-1"
override :ruby, version: aix? ? "3.0.3" : "3.1.5"
override "ruby-windows-devkit-bash", version: "3.1.23-4-msys-1.0.18"
override "ruby-msys2-devkit", version: "3.1.5-1"
override "util-macros", version: "1.19.0"
override "xproto", version: "7.0.28"
override "zlib", version: "1.2.11"
