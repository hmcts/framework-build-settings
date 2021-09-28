# Travis Build Helpers

## Overview
This project contains build processes for use with Travis CI including but not limited to:

* Simplified Java build processes
* Integration with Bintray
* Maven settings.xml


## Java Build Processes

These can be used instead of the default behaviours from Travis CI.

Each of them uses the [Maven Wrapper](https://github.com/takari/maven-wrapper) if present in the project
All scripts accept additional goals or parameters as per default maven behaviour

* *install.sh*: goal: _none_ one must be supplied, but handles dependencies in multi-module builds
* *script-install.sh*: goal: _install_
* *script.sh*: goal: _verify_
* *after\_success.sh*: goal: (on release- tag only) _deploy_, otherwise no action

## External Integrations

We use the following external services:

* [SonarCloud CJSCommonPlatform](https://sonarcloud.io/organizations/cjscommonplatform/projects)
* [Coveralls CJSCommonPlatform](https://coveralls.io/github/CJSCommonPlatform)

Where necessary integrations can use cjs-commonplatform-ci service account. This account has sufficient rights to perform the
appropriate tasks - but is not an administrator for any of those services.

Instead existing members of TechPod and DevOps teams are administrators

### SonarCloud

Standard integration as per [Travis CI docs](https://docs.travis-ci.com/user/sonarcloud/) - uses service account for internal PR only
Note that the github\_token integration mechanism has been deprecated and should be replaced

### Coveralls

Standard integration as per [Travis CI docs](https://docs.travis-ci.com/user/coveralls/)

