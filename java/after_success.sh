#!/bin/bash -x
# We only deploy on release tags
MVN=$([[ -x ./mvnw ]] && echo "./mvnw" || echo "mvn")
mvn -DskipTests=true -DskipITs=true -Dmaven.javadoc.skip=true -Prelease -DdeployAtEnd=true -DretryFailedDeploymentCount=2 -B --errors deploy "$@"
mvn -DskipTests=true -DskipITs=true -Dmaven.javadoc.skip=true -Psecurecentral-upload -DdeployAtEnd=true -DretryFailedDeploymentCount=2 -B --errors deploy "$@"
