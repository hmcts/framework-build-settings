#!/bin/bash -x
# We only deploy on release tags
MVN=$([[ -x ./mvnw ]] && echo "./mvnw" || echo "mvn")
mvn -DskipTests=true -DskipITs=true -Dmaven.javadoc.skip=true -Prelease -DaltDeploymentRepository=securecentral-upload::default::https://libraries-internal.mdv.cpp.nonlive/artifactory/libs-snapshot-sp-azure -DdeployAtEnd=true -DretryFailedDeploymentCount=2 -B --errors deploy "$@"

