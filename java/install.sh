#!/bin/bash -x
# Package is required to resolve dependencies properly in mutli-module builds
# https://issues.apache.org/jira/browse/MDEP-204
# https://issues.apache.org/jira/browse/MDEP-516
MVN=$([[ -x ./mvnw ]] && echo "./mvnw" || echo "mvn")
$MVN -B -V -Dsilent=true -DskipTests=true -DskipITs=true -Dmaven.javadoc.skip=true package org.apache.maven.plugins:maven-dependency-plugin:3.0.2:go-offline "$@"
