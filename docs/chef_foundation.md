# Chef Foundation

Package all of chef's omnibus dependencies ahead of time so that when a chef omnibus build occurs, it will only need to install the chef gem (and gem dependencies) on top and repackage.

## Motivation

Each time a chef omnibus package is produced, chef and its dependencies are compiled and installed on all platforms. By compiling those dependencies ahead of time into an omnibus package, we can use that package for controlling the version of chef's dependencies separately from chef the gem. This will allow us to reproduce test environments easier, test the gem against newer versions of dependencies, and decrease build times.

## Specification

Chef's dependencies will be defined as new omnibus software called "chef-foundation" which the current omnibus software "chef" will depend on. Chef foundation will include:

* preparation
* ruby
* libarchive
* nokogiri
* gem-permissions
* shebang-cleanup
* version-manifest
* openssl-customization
* ruby-msys2-devkit (windows only)
* ruby-cleanup
* more-ruby-cleanup

Chef foundation will also set all the overrides currently defined in `omnibus_overrides.rb`. The chef foundation omnibus project will live in its own repository (github.com/chef/chef-foundation) and a new build will be produced when chef's dependencies are changed. Chef's unit testing will be extended to test against the latest chef foundation in the stable channel.

The initial version of Chef Foundation will be built and installed as an omnibus package on a host. As defined above
this package will be used for testing the latest version of Chef in the pipeline along with being included as a base
package inside the Chef omnibus package. The key point here is that during the Chef omnibus packaging stage, we will
require chef-foundation be installed prior running the omnibus commands. For more information on thsi process please see
the [Hermetic Builds](./hermetic_builds.md) section of this documentation.

In future iterations Chef Foundation may want to be packaged in a way that can be used as a first class omnibus
dependency, rather than a local source. This is out of scope currently as it will require changes the omnibus. The
changes would be to support installation (build) from the packagers that are used by Chef Foundation (`rpm`, `deb`,
`msi`, `dmg`). As an alternative omnibus could be extended to support a packaging type of `zip` to which we would
package Chef Foundation as, then we could build a software definition similar to other platform specific upstream
packages such as Golang.
