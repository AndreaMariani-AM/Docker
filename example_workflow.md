# Workflow Example

This is an example workflow of what steps are needed to produce a singularity image that works.

* On a local machine (cause on HPC docker won't be installed for security reasons) use docker to create a docker container. A Docker file is required with the "passages" that have to be done. Packages con be written there or in another file that will be `COPY` into that. The building script is meant to build the actual container but i still need to work on it
` docker build -t name_of_the_image .` is the cmd to use.

* After the completion of the image, the container has to be sent to docker hub. The steps are:
	1) login with `docker login` into the account
	2) tag the container with the username with `docker tag image username/image:latest` 
	3) push the tagged container with `docker push username/image:latest` to the repo.
	4) `docker rmi tagged/image` to remove the tagged image

* Once the docker image is hosted on docker hub i can pull it from the cluster with singularity with `singularity pull name_of_image.sif docker:/username/image:tag`. This is a fully functional image that can be used for various stuff, including snakemake pipelines.
