#!/bin/bash -x
# https://issues.apache.org/jira/browse/MDEP-204
# https://issues.apache.org/jira/browse/MDEP-516
mvn -B -Dsilent=true -DskipTests=true -DskipITs=true package org.apache.maven.plugins:maven-dependency-plugin:3.0.1:go-offline "$@"
