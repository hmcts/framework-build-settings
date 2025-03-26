#!/bin/bash -x
# We only deploy on release tags
MVN=$([[ -x ./mvnw ]] && echo "./mvnw" || echo "mvn")
$MVN -DskipTests=true -DskipITs=true -Dmaven.javadoc.skip=true -Prelease,cloudsmith -DdeployAtEnd=true -DretryFailedDeploymentCount=2 -B --errors deploy "$@"