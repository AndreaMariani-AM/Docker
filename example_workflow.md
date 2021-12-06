# Workflow Example

This is an example workflow of what steps are needed to produce a singularity image (from a docker image) that works w/ our pipelines written in snakemake.

We have to start with the building of a docker image and for this, a Dockerfile is required that has the recipe for that particular image. I like to separete packages based on their general function in different files, so it's easier to edit them. The add them to the Dockerfile the `COPY` command is what is used. The building script builds the actual image and pushes it to Docker Hub where it'll be hosted. From here the image is pulled with singularity to a location on our cluster folder and can be used from there.

## Prerequisites

A [Docker Hub repo](https://www.docker.com/)

# Workflow (general)

## Use docker to create a docker image

This has to be done on a local machine 'cause on HPC, docker won't be installed for security reasons

```
docker build -t name_of_the_image . 
```

`-t` id the --tag flag and it's the name of the docker image i'm building. `.` means ofc here.

## Sending the image to Docker Hub

These are the minimun steps required to push the image to Docker Hub.

* login into the account

```
docker login
``` 

You'll be prompted with username and password of your Docker Hub repo

* Tag the container

```
docker tag image username/image:latest
``` 

This can be done with any tag, but i like to use as a tag my username.

* Push the tagged container to the repo

```
docker push username/image:latest
``` 

* To remove the tagged images (if needed)

```
docker rmi tagged/image
``` 

They actually quite heavy (~ 8gb for ChIPseq and depending on the number of packages in it)

* Pull the image on the cluster

```
singularity pull name_of_image.sif docker://username/image:tag
```
From any directory, pull the docker image. The command `pull` takes a docker image and create a copy as a singularity image.

* Notes on the workflow

This general workflow creates a fully functional image, however i'd advise some little changes here and there to make it quicker, more automated and less prone to errors.

# Alternative Way (recommendend)

* Building script

Create a bash script that builds the image, it'll be called like any other script with `./script.sh`. In this script, first we create a variable that contains the day when the image is created, the building function with a couple of options, the tagging step that's skipped 'cause we add the username to the image directly here, the redirection of STDOUT and ERR to a file that can be inspected to troubleshoot the build and finally whe push the newly created image to the repo. The script looks like this.

```
IMAGE_VERSION=$(date "+%m%d%y") # this sets the version

docker build --progress=plain --no-cache -t andreamariani/rnaseq_snakemake:${IMAGE_VERSION} -t andreamariani/rnaseq_snakemake:latest . 2>&1 | tee stdout.log && \
docker push andreamariani/rnaseq_snakemake:${IMAGE_VERSION}

```

`--progress=plain` it's similar to a verbose argument, but in reality extends the STDOUT that was shrinked with buildkit.
`--no-cache` doesn't cache the build. I'd advise to use it only when building the final image or when conflicts between dependencies are spotted, se we can move around stuff and fix it.
`tee` allows to both write to a file (STDOUT and ERR `2>&1`) and to standard output.

This is the script i'd use when building the final image, below there's commands i'd use when first testing the build. Uncomment and use those.

* Dockerfile

The only difference is that I write packages in different file based on either function or repo used to download them. Then, w/ `COPY` I pull them into the build. I also like to move those file in a new directory to be as tidy as possible.


# Interactive way

* This is probably the smartest solution, aka opening a container and working directly in it to debug softwares incompatibilities. I still need to understand how's done.