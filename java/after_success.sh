#!/bin/bash -x
# We only deploy on release tags
MVN=$([[ -x ./mvnw ]] && echo "./mvnw" || echo "mvn")
$MVN -DskipTests=true -DskipITs=true -Dmaven.javadoc.skip=true -Prelease -DdeployAtEnd=true -DretryFailedDeploymentCount=2 -B --errors deploy "$@"
$MVN -DskipTests=true -DskipITs=true -Dmaven.javadoc.skip=true -DaltDeploymentRepository=securecentral-upload::default::${artifactoryServer}/${artifactoryRepo} -DdeployAtEnd=true -DretryFailedDeploymentCount=2 -B --errors deploy "$@"

