#!/bin/bash

docker build -t octoblu/flow-util:latest .
docker build -t octoblu/flow-util:entrypoint entrypoint

docker run octoblu/flow-util:entrypoint --help
