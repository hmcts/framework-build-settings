#!/bin/bash -x
# Package is required to resolve dependencies properly in mutli-module builds
# https://issues.apache.org/jira/browse/MDEP-204
# https://issues.apache.org/jira/browse/MDEP-516
mvn -B -V -Dsilent=true -DskipTests=true -DskipITs=true -Dorg.slf4j.simpleLogger.showDateTime=true -Dmaven.javadoc.skip=true package org.apache.maven.plugins:maven-dependency-plugin:3.0.1:go-offline "$@"
