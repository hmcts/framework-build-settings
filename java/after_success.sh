#!/bin/bash -x
# We only deploy on release tags
[[ $TRAVIS_TAG == release-* ]] && mvn -DskipTests=true -DskipITs=true -DdeployAtEnd=true -DretryFailedDeploymentCount=2 -B --errors deploy "$@"
