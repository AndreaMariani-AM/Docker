#!/bin/bash

##===========================================##===========================================##
# Set image version
##===========================================##===========================================##
IMAGE_VERSION=$(date "+%m%d%y")


##===========================================##===========================================##
# Build the image and push it to docker hub
##===========================================##===========================================##
docker build --progress=plain --no-cache -t andreamariani/chipseq_snakemake:${IMAGE_VERSION} -t andreamariani/chipseq_snakemake:latest . 2>&1 | tee stdout.log && \
docker push andreamariani/chipseq_snakemake:${IMAGE_VERSION}

# USE THIS LINES ONLY WHEN EVERYTHING WOKRS. Below is for testing.


##===========================================##===========================================##
# Bulding/testing components of the image
##===========================================##===========================================##
#docker build --progress=plain -t andreamariani/chipseq_snakemake:${IMAGE_VERSION} -t andreamariani/chipseq_snakemake:latest . 2>&1 | tee stdout.log

# I think --no-cache arguments it's usefull when building the final image of when there are problmes withe dependencies,
# otherwise it slows down everything. Last part redirects STDOUT/ERR both to STDOUT and a file that it's usefull to check
# whether packgaes have been installed since the output is super verbose. Sometimes packages don't get installed but it doens't
# throw and error. In this way i can double check what happened.