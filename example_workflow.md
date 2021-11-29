# Workflow Example

This is an example workflow of what steps are needed to produce a singularity image that works.

* On a local machine (cause on HPC docker won't be installed for security reasons) use docker to create a docker container. A Docker file is required with the "passages" that have to be done. Packages con be written there or in another file that will be `COPY` into that. The building script is meant to build the actual container but i still need to work on it

```
docker build -t name_of_the_image . 
```
is the cmd to use.

* After the completion of the image, the container has to be sent to docker hub. The steps are:

login into the account

```
docker login
``` 

Tag the container with the username with 

```
docker tag image username/image:latest
``` 

Push the tagged container to the repo

```
docker push username/image:latest
``` 

To remove the tagged image

```
docker rmi tagged/image

``` 


* Once the docker image is hosted on docker hub i can pull it from the cluster with singularity with 

```
singularity pull name_of_image.sif docker://username/image:tag
```

This is a fully functional image that can be used for various stuff, including snakemake pipelines.


# Alternative Way

* The the `building-script.sh` i can tag the image while building it. This aloows we to skip the tagging step and after login, directly push the image to create a new repo.
