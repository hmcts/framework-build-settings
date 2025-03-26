#!/bin/bash -x
MVN=$([[ -x ./mvnw ]] && echo "./mvnw" || echo "mvn")
mvn -B -V verify "$@"
