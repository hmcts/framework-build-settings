#!/bin/bash -x
[[ -x ./mvnw ]] && MVN=./mvnw || MVN=mvn
$MVN -B -V verify "$@"
