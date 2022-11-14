
# Chef Foundation

Chef Foundation creates a native platform package that contains the required dependencies used for building the Chef Omnibus packages.
Currently it supports the same operating systems as the Chef Omnibus project since it will be an intermediate package used to create the final Chef Omnibus package.


## Why?

The Chef Foundation package aims to:

* Provide chef developers and customers an easier way to reproduce a set of Chef's dependencies on a given platform.
* Make it easier to test new versions of the Chef executables against a new set of Chef dependencies and new platforms.
* Reduce build times of Chef's Omnibus package.


## Installation

Check out the [docs folder](https://github.com/chef/chef-foundation/tree/master/docs) for the specific steps to build and install on your operating system distribution. Platform specific notes are included in the operating system distribution documentation if they are required.


## Usage

### Building in Containers

Some platforms are able to be built inside containers supplied by the releng team.

```shell
$ git clone https://github.com/chef/chef-foundation.git
$ cd chef-foundation
$ docker run -it --privileged  --volume $(pwd):/home/chef-foundation gscho/omnibus-toolchain:3.0.0 /bin/bash
$ cd /home/chef-foundation
$ export PATH=/opt/omnibus-toolchain/embedded/bin:$PATH
$ bundle install --without development
$ bundle exec omnibus build chef-foundation
```

Other platforms such as AIX, Solaris, MacOS, etc. will need to be built on a virtual machine:

```shell
$ git clone https://github.com/chef/chef-foundation.git
$ cd chef-foundation
$ curl -fsSL https://omnitruck.chef.io/chef/install.sh | bash -s -- -P "omnibus-toolchain"
$ export PATH=/opt/omnibus-toolchain/embedded/bin:$PATH
$ bundle install --without development
$ bundle exec omnibus build chef-foundation
```

After the build completes packages will be available in the `pkg/` folder.

### Clean

You can clean up all temporary files generated during the build process with
the `clean` command:

```shell
$ bundle exec omnibus clean chef-foundation
```

Adding the `--purge` purge option removes __ALL__ files generated during the
build including the project install directory (`/opt/chef`) and
the package cache directory (`/var/cache/omnibus/pkg`):

```shell
$ bundle exec omnibus clean chef-foundation --purge
```

### Help

Full help for the Omnibus command line interface can be accessed with the
`help` command:

```shell
$ bundle exec omnibus help
```

## License

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
