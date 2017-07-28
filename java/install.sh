#!/bin/bash -x
mvn -B -Dsilent=true -DskipTests=true -DskipITs=true package org.apache.maven.plugins:maven-dependency-plugin:3.0.1:go-offline "$@"
