#!/bin/bash
# Be more clever about the caching behaviour
SCOPE=${1:-test}
mvn -B -Dsilent=true -DincludeScope="${SCOPE}" org.apache.maven.plugins:maven-dependency-plugin:3.0.1:go-offline
