#!/bin/bash -x
MVN=$([[ -x ./mvnw ]] && echo "./mvnw" || echo "mvn")
$MVN -B -V install "$@"
