#!/bin/bash

# This is a small script to build the Docker image

#set image version
IMAGE_VERSION=$(date "+%m%d%y")

# Build the image and push it to docker hub
docker build --progress=plain --no-cache -t andreamariani/chipseq_snakemake:${IMAGE_VERSION} -t andreamariani/chipseq_snakemake:latest . && \
docker push andreamariani/chipseq_snakemake:${IMAGE_VERSION}