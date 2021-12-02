#!/bin/bash

# This is a small script to build the Docker image

#set image version
IMAGE_VERSION=$(date "+%m%d%y")

# Build the image
docker build --progress=plain --no-cache -t andreamariani/test_py37:${IMAGE_VERSION} -t andreamariani/test_py37:latest .

# docker build --no-cache -t andreamariani/rnaseq:${IMAGE_VERSION} -t andreamariani/rnaseq:latest . && \
# docker push andreamariani/rnaseq:${IMAGE_VERSION}