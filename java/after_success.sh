#!/bin/bash -x
# We only deploy on release tags
[[ -x ./mvnw ]] && MVN=./mvnw || MVN=mvn
[[ $TRAVIS_TAG == release-* ]] && $MVN -DskipTests=true -DskipITs=true -DdeployAtEnd=true -DretryFailedDeploymentCount=2 -B --errors deploy "$@"
