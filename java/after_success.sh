#!/bin/bash -x
# We only deploy on release tags
MVN=$([[ -x ./mvnw ]] && echo "./mvnw" || echo "mvn")
mvn -DskipTests=true -DskipITs=true -Dmaven.javadoc.skip=true -DdeployAtEnd=true -DretryFailedDeploymentCount=2 -B --errors deploy "$@"

