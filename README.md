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
* [Bintray CJSCommonPlaform](https://bintray.com/cjscommonplatform)

Where necessary integrations can use cjs-commonplatform-ci service account. This account has sufficient rights to perform the
appropriate tasks - but is not an administrator for any of those services.

Instead existing members of TechPod and DevOps teams are administrators

### SonarCloud

Standard integration as per [Travis CI docs](https://docs.travis-ci.com/user/sonarcloud/) - uses service account for internal PR only
Note that the github\_token integration mechanism has been deprecated and should be replaced

### Coveralls

Standard integration as per [Travis CI docs](https://docs.travis-ci.com/user/coveralls/)

### Bintray Integration

Bintray does have standard [Travis CI docs](https://docs.travis-ci.com/user/deployment/bintray/) but we use the maven-deploy-pluign to
deploy to Bintray instead

To add a project to Bintray:

1. Login to Bintray and import the Github project (you must be a member of the Bintray CJSCommonPlatform org to do this), even if the project is empty
   This creates the "package" that bintray uses to associate specific builds as everything in our setup is deployed to the same repository (maven-releases)
2. Encrypt: BINTRAY\_USERNAME and BINTRAY\_PASSWORD entries in .travis.yml or in the project's secure environment settings in the Travis CI UI
   These are used in maven's settings.xml in this repo as the deployment authentication for Bintray - these are the bintray credentials of the
   service account
3. Use the CJS Common Platform super pom (or a descendent of it) - this sets up the right distribution URLs for deployment
4. In the project pom, set the property `cpp.repo.name` to the name of the repo / package name in bintray. This associates the build output
   with the package in bintray by including it as a property in the deployment URL. This solution only works if the package exists in bintray first
   hence step #1
