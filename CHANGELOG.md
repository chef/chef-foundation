# Changelog

<!-- latest_release 3.2.0 -->
## [3.2.0](https://github.com/chef/chef-foundation/tree/3.2.0) (2024-04-03)

#### Merged Pull Requests
- gem openssl 3.0.0 install to be consistent with ruby 3.1.2 [#114](https://github.com/chef/chef-foundation/pull/114) ([muthuja](https://github.com/muthuja))
<!-- latest_release -->

<!-- release_rollup -->
### Changes since latest stable release

#### Merged Pull Requests
- gem openssl 3.0.0 install to be consistent with ruby 3.1.2 [#114](https://github.com/chef/chef-foundation/pull/114) ([muthuja](https://github.com/muthuja)) <!-- 3.2.0 -->
- remove mac 10.15 from release pipeline and add mac 11 as builder [#116](https://github.com/chef/chef-foundation/pull/116) ([muthuja](https://github.com/muthuja)) <!-- 3.1.24 -->
- this is just test pr to check release pipeline build [#109](https://github.com/chef/chef-foundation/pull/109) ([muthuja](https://github.com/muthuja)) <!-- 3.1.23 -->
- Update Windows builder matching Infra-client  platforms [#108](https://github.com/chef/chef-foundation/pull/108) ([poorndm](https://github.com/poorndm)) <!-- 3.1.22 -->
- upgrade openssl version to 3.0.9 [#103](https://github.com/chef/chef-foundation/pull/103) ([muthuja](https://github.com/muthuja)) <!-- 3.1.21 -->
- To fix signature issue on Notarization [#106](https://github.com/chef/chef-foundation/pull/106) ([poorndm](https://github.com/poorndm)) <!-- 3.1.20 -->
- Revert &quot;openssl upgrade to 3.0.11&quot; [#105](https://github.com/chef/chef-foundation/pull/105) ([tpowell-progress](https://github.com/tpowell-progress)) <!-- 3.1.19 -->
- 9.0.24 omnibus bump for Solaris pkgmogrify changes [#104](https://github.com/chef/chef-foundation/pull/104) ([tpowell-progress](https://github.com/tpowell-progress)) <!-- 3.1.18 -->
- openssl upgrade to 3.0.11 [#102](https://github.com/chef/chef-foundation/pull/102) ([muthuja](https://github.com/muthuja)) <!-- 3.1.17 -->
- added amazon2023 builder and tester [#101](https://github.com/chef/chef-foundation/pull/101) ([muthuja](https://github.com/muthuja)) <!-- 3.1.16 -->
- Downgrade bash to 5.1.8 on solaris [#100](https://github.com/chef/chef-foundation/pull/100) ([poorndm](https://github.com/poorndm)) <!-- 3.1.15 -->
- unpinned/removed libxslt and libxml2 [#87](https://github.com/chef/chef-foundation/pull/87) ([muthuja](https://github.com/muthuja)) <!-- 3.1.14 -->
- Jfm/chef18 openssl 1.0.2zi - part 2 [#85](https://github.com/chef/chef-foundation/pull/85) ([johnmccrae](https://github.com/johnmccrae)) <!-- 3.1.13 -->
- updating code owners [#88](https://github.com/chef/chef-foundation/pull/88) ([sean-simmons-progress](https://github.com/sean-simmons-progress)) <!-- 3.1.12 -->
- Updating openssl to 1.0.2zi [#84](https://github.com/chef/chef-foundation/pull/84) ([johnmccrae](https://github.com/johnmccrae)) <!-- 3.1.11 -->
- Support Rocky-arm-8/9 [#81](https://github.com/chef/chef-foundation/pull/81) ([poorndm](https://github.com/poorndm)) <!-- 3.1.10 -->
- updated gemfile lock omnibus version to 9.0.23 [#74](https://github.com/chef/chef-foundation/pull/74) ([muthuja](https://github.com/muthuja)) <!-- 3.1.9 -->
- Added rockylinux-9 to chef-foundation [#71](https://github.com/chef/chef-foundation/pull/71) ([muthuja](https://github.com/muthuja)) <!-- 3.1.8 -->
- Update openssl version to 1.0.2zf [#67](https://github.com/chef/chef-foundation/pull/67) ([muthuja](https://github.com/muthuja)) <!-- 3.1.7 -->
- Add RockyLinux-8 builder &amp; Tester [#65](https://github.com/chef/chef-foundation/pull/65) ([poorndm](https://github.com/poorndm)) <!-- 3.1.6 -->
- Update openssl to 1.0.2ze [#63](https://github.com/chef/chef-foundation/pull/63) ([poorndm](https://github.com/poorndm)) <!-- 3.1.5 -->
- updating code owners [#58](https://github.com/chef/chef-foundation/pull/58) ([sean-simmons-progress](https://github.com/sean-simmons-progress)) <!-- 3.1.4 -->
- Revert to using OpenSSL 1.0.xx  [#62](https://github.com/chef/chef-foundation/pull/62) ([vkarve-chef](https://github.com/vkarve-chef)) <!-- 3.1.3 -->
- CHEF-2776 Exclude AIX platform [#60](https://github.com/chef/chef-foundation/pull/60) ([poorndm](https://github.com/poorndm)) <!-- 3.1.2 -->
- Update Omnibus-s/w version to pick openssl config changes [#59](https://github.com/chef/chef-foundation/pull/59) ([poorndm](https://github.com/poorndm)) <!-- 3.1.1 -->
- Build with openssl 3.0.4 [#56](https://github.com/chef/chef-foundation/pull/56) ([poorndm](https://github.com/poorndm)) <!-- 3.1.0 -->
- Update dependency to proxifier2  [#54](https://github.com/chef/chef-foundation/pull/54) ([vkarve-chef](https://github.com/vkarve-chef)) <!-- 3.0.6 -->
- bundle update to have correct commit with internal cachine fix in it [#50](https://github.com/chef/chef-foundation/pull/50) ([justingruber](https://github.com/justingruber)) <!-- 3.0.5 -->
- re-enabling internal source flag for omnibus [#44](https://github.com/chef/chef-foundation/pull/44) ([justingruber](https://github.com/justingruber)) <!-- 3.0.4 -->
- Change package identifier. [#42](https://github.com/chef/chef-foundation/pull/42) ([gcs-devel](https://github.com/gcs-devel)) <!-- 3.0.3 -->
- Use external sources for now [#40](https://github.com/chef/chef-foundation/pull/40) ([gcs-devel](https://github.com/gcs-devel)) <!-- 3.0.2 -->
- Revert to using rubygems.org as the default source. [#39](https://github.com/chef/chef-foundation/pull/39) ([gcs-devel](https://github.com/gcs-devel)) <!-- 3.0.1 -->
- Move back to using omnibus_overrides.rb [#33](https://github.com/chef/chef-foundation/pull/33) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.26 -->
- Use artifactory rubygems proxy [#32](https://github.com/chef/chef-foundation/pull/32) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.25 -->
- Remove wix folder create [#31](https://github.com/chef/chef-foundation/pull/31) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.24 -->
- Use omnibus on development branch. [#30](https://github.com/chef/chef-foundation/pull/30) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.23 -->
- Disable internal sources until artifactory token is provided. [#29](https://github.com/chef/chef-foundation/pull/29) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.22 -->
- Gcs devel/build from internal src bs 109 [#28](https://github.com/chef/chef-foundation/pull/28) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.21 -->
- Use version that creates directories [#27](https://github.com/chef/chef-foundation/pull/27) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.20 -->
- Renamed directory [#25](https://github.com/chef/chef-foundation/pull/25) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.19 -->
- Fix windows [#24](https://github.com/chef/chef-foundation/pull/24) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.18 -->
- Set project location to chef-foundation [#23](https://github.com/chef/chef-foundation/pull/23) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.17 -->
- Use test version of omnibus-buildkite-plugin [#22](https://github.com/chef/chef-foundation/pull/22) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.16 -->
- Use test version of omnibus-buildkite-plugin [#21](https://github.com/chef/chef-foundation/pull/21) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.15 -->
- Add the preinst package script [#20](https://github.com/chef/chef-foundation/pull/20) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.14 -->
- Skip windows again [#19](https://github.com/chef/chef-foundation/pull/19) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.13 -->
- Copied resources from chef/chef and modified WIX installer config [#18](https://github.com/chef/chef-foundation/pull/18) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.12 -->
- Only build windows [#17](https://github.com/chef/chef-foundation/pull/17) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.11 -->
- Build only containerized platforms for now [#16](https://github.com/chef/chef-foundation/pull/16) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.10 -->
- Skip windows until the ami is fixed [#15](https://github.com/chef/chef-foundation/pull/15) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.9 -->
- Omit the ChefLogDllPath from foundation builds [#14](https://github.com/chef/chef-foundation/pull/14) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.8 -->
- Add openssl customization files [#13](https://github.com/chef/chef-foundation/pull/13) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.7 -->
- Use lockfile from chef/chef/omnibus [#12](https://github.com/chef/chef-foundation/pull/12) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.6 -->
- Update platforms in Gemfile.lock [#11](https://github.com/chef/chef-foundation/pull/11) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.5 -->
- BS-28/chef foundation all platforms [#10](https://github.com/chef/chef-foundation/pull/10) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.4 -->
- Update package scripts [#9](https://github.com/chef/chef-foundation/pull/9) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.3 -->
- Set a custom install dir [#8](https://github.com/chef/chef-foundation/pull/8) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.2 -->
- Update config.yml [#7](https://github.com/chef/chef-foundation/pull/7) ([gcs-devel](https://github.com/gcs-devel)) <!-- 0.1.1 -->
<!-- release_rollup -->

<!-- latest_stable_release -->
<!-- latest_stable_release -->