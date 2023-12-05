# Contributing to PROJECT_NAME

# Testing your PR #

Branching. 

- Main - this is for github.com/chef/chef:main
- 17-stable - this is for github.com/chef/chef:chef-17
- please add more here if you onboard more tools, branches, platform. 

1. Once you are ready to open a draft PR, please go ahead and commit your changes to your branch. Then open a PR based off what branch you pulled from. 

2. After you have your PR open, or your branch created, please run a build here: https://buildkite.com/chef/chef-chef-foundation-main-omnibus-adhoc
    - Start a new build with your branch name as your branch. 
    - If you want to target a specific system for your build, you can pass a env var:`OMNIBUS_FILTER="*sles*"` 
        - or you can execute the follwoing if you have the bk cli installed and token setup: bk build create `--env='OMNIBUS_FILTER="*windows*"' --pipeline=chef/chef-chef-foundation-main-omnibus-adhoc --branch='your_Branch'`

3. If the build completes for the pipeline, you can go ahead and mark the PR as open and ready

4. The team will then approve and we can merge the PR. 



