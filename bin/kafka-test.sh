#!/bin/bash

# build project
gradlew build

# run module test cases
gradlew core:test
gradlew clients:test
gradlew connect:[submodule]:test
gradlew streams:test

# run specific test case
gradlew core:test --tests kafka.log.LogTest

# package release
# kafka broker: core/build/distributions
# kafka clients: clients/build/libs
# kafka streams: streams/build/libs
gradlew clean releaseTarGz

