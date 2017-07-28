#!/bin/bash -x
mvn -B -Dsilent=true org.apache.maven.plugins:maven-dependency-plugin:3.0.1:go-offline "$@"
