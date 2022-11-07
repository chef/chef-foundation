#
# Copyright:: Copyright (c) Chef Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "chef-foundation"
friendly_name "Chef Foundation"
maintainer "Chef Software, Inc. <maintainers@chef.io>"
homepage "https://www.chef.io"
license "Apache-2.0"
license_file "LICENSE"

build_iteration 1
# Do not use __FILE__ after this point, use current_file. If you use __FILE__
# after this point, any dependent defs (ex: angrychef) that use instance_eval
# will fail to work correctly.
current_file ||= __FILE__
version_file = File.expand_path("../../../VERSION", current_file)
build_version IO.read(version_file).strip

if windows?
  # NOTE: Ruby DevKit fundamentally CANNOT be installed into "Program Files"
  #       Native gems will use gcc which will barf on files with spaces,
  #       which is only fixable if everyone in the world fixes their Makefiles
  install_dir  "#{default_root}/opscode/chef"
  package_name "chef-client"
else
  install_dir "#{default_root}/chef"
end

override "libffi", version: "3.4.2"
override "libiconv", version: "1.16"
override "liblzma", version: "5.2.5"
override "libtool", version: "2.4.2"

# libxslt 1.1.35 does not build successfully with libxml2 2.9.13 on Windows so we will pin
# windows builds to libxslt 1.1.34 and libxml2 2.9.10 for now and followup later with the
# work to fix that issue in IPACK-145.
override "libxml2", version: windows? ? "2.9.10" : "2.9.13"
override "libxslt", version: windows? ? "1.1.34" : "1.1.35"
override "libyaml", version: "0.1.7"
override "makedepend", version: "1.0.5"
override "ncurses", version: "6.3"
override "nokogiri", version: "1.13.1"
override "openssl", version: mac_os_x? ? "1.1.1m" : "1.0.2zb"
override "pkg-config-lite", version: "0.28-1"
override :ruby, version: aix? ? "3.0.3" : "3.1.2"
override "ruby-windows-devkit-bash", version: "3.1.23-4-msys-1.0.18"
override "ruby-msys2-devkit", version: "3.1.2-1"
override "util-macros", version: "1.19.0"
override "xproto", version: "7.0.28"
override "zlib", version: "1.2.11"

dependency "preparation"

# THIS CAME FROM OMNIBUS-SOFTWARE CHEF.RB
dependency "ruby"
dependency "libarchive" # for archive resource

# FOUNDATION == EVERYTHING EXCEPT THIS
# CHEF == ONLY THIS (plus the package stuff)
# dependency "other-chef"

# dependency "chef"

#
# addons which require omnibus software defns (not direct deps of chef itself - RFC-063)
#
dependency "nokogiri" # (nokogiri cannot go in the Gemfile, see wall of text in the software defn)

# FIXME?: might make sense to move dependencies below into the omnibus-software chef
#  definition or into a chef-complete definition added to omnibus-software.
dependency "gem-permissions"
dependency "shebang-cleanup"
dependency "version-manifest"
dependency "openssl-customization"

# devkit needs to come dead last these days so we do not use it to compile any gems
dependency "ruby-msys2-devkit" if windows?

dependency "ruby-cleanup"

package :rpm do
  signing_passphrase ENV["OMNIBUS_RPM_SIGNING_PASSPHRASE"]
  compression_level 1
  compression_type :xz
end

package :deb do
  compression_level 1
  compression_type :xz
end

proj_to_work_around_cleanroom = self # wat voodoo hackery is this?
package :pkg do
  identifier "com.getchef.pkg.#{proj_to_work_around_cleanroom.name}"
  signing_identity "Chef Software, Inc. (EU3VF8YLX2)"
end
compress :dmg

msi_upgrade_code = "D607A85C-BDFA-4F08-83ED-2ECB4DCD6BC5"
project_location_dir = name
package :msi do
  fast_msi true
  upgrade_code msi_upgrade_code
  wix_candle_extension "WixUtilExtension"
  wix_light_extension "WixUtilExtension"
  signing_identity "13B510D1CF1B3467856A064F1BEA12D0884D2528", machine_store: true
  parameters ChefLogDllPath: windows_safe_path(gem_path("chef-[0-9]*-x64-mingw-ucrt/ext/win32-eventlog/chef-log.dll")),
             ProjectLocationDir: project_location_dir
end

# We don't support appx builds, and they eat a lot of time.
package :appx do
  skip_packager true
end

runtime_dependency "coreutils" if rhel?
