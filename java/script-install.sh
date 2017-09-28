#!/bin/bash -x
[[ -x ./mvnw ]] && MVN=./mvnw || MVN=mvnw
$MVN -B -V install "$@"
