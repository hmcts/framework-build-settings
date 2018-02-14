#!/bin/bash -x
# We only deploy on release tags
MVN=$([[ -x ./mvnw ]] && echo "./mvnw" || echo "mvn")
[[ $TRAVIS_TAG == release-* ]] && $MVN -DskipTests=true -DskipITs=true -Prelease -DdeployAtEnd=true -DretryFailedDeploymentCount=2 -B --errors deploy "$@"
