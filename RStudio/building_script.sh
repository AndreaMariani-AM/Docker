#!/bin/bash

# This is a small script to build the Docker image

#set image version
IMAGE_VERSION=$(date "+%m%d%y")

# Build the image
docker build --no-cache -t andreamariani/rstudio:${IMAGE_VERSION} -t andreamariani/rstudio:latest .

# docker build --no-cache -t andreamariani/rstudio:${IMAGE_VERSION} -t andreamariani/rstudio:latest . && \
# docker push andreamariani/rstudio:${IMAGE_VERSION}