#!/bin/bash -x
# We only deploy on release tags
MVN=$([[ -x ./mvnw ]] && echo "./mvnw" || echo "mvn")
$MVN help:active-profiles -Prelease,securecentral-upload
$MVN -DskipTests=true -DskipITs=true -Dmaven.javadoc.skip=true -Prelease,securecentral-upload -DdeployAtEnd=true -DretryFailedDeploymentCount=2 -B --errors deploy "$@"
