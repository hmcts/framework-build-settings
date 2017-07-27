#!/bin/bash
# We only deploy on release tags
[[ $TRAVIS_TAG == release-* ]] && mvn -DskipTests=true -DskipITs=true -DdeployAtEnd=true -DretryFailedDeploymentCount=2 -B --errors org.apache.maven.plugins:maven-deploy-plugin:2.8.2:deploy
