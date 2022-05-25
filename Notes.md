# Notes on Docker and Singularity

* This is a file that contains notes on building Docker images and so on. The idea is to use Docker to "easily" build an image that's 100% reproducible
and the use singularity to pull it and use it in the HPC. For now i'll follow Arnaud tutorial here: https://web.microsoftstream.com/video/6bd1f122-29f5-4844-9c02-3fb4d5a7aa22 and then
i'll update it with more specific softwares i want to use for our pipelines.

* Docker images have to be tested on local machines and can't be created on the cluster, but with singularity i can use it on the cluster. This is because when using docker and accessing an image it'll allow you to become root user of that machine and that's NO BUENO on the HPC.

* Singularity doesn't allow you to become administrator but uses see groups (or sea groups, dunno tbh. It's just the name of ieo5776 type of user). I can download the docker image through singularity

## Docker file

A Dockerfile is a file that explain how we want to build the image.

`FROM` specify the distribution i want to use
`RUN` is the cmd to create the image 

```
RUN apt-get update && \
	apt-get instal -y samtools
```
Means go online and check all available packages and the install this packages `myPackage`. -y is --yes, this is because a docker image can't be interactive. When i install pkg i'll ask for confirmation and when given the `yes`, it'll exit the image closing the session and won't create anything. The flag is to overcome this.

When i rebuild the image, docker cheks if something is new or not, inf nothing;s changed then it takes a couple of second to rebuild it.

**note** that when i add something new, like a pakckage it's better if i add it at the end, otherwise when docker encounters something new, it'll build the image from scratch, from that point onward.


## Terminal CMDs for Docker and Singularity

### Docker
```
docker build -t mytag .
```
This is the general cmd to create a docker images, -t stands for `tag` and it's the name i want to give to the container. `.` means ofc here, this repo

```
docker run --rm docker_image software
```
This run cmd is to use a software inside a docker container. When i use run, docker creates a container based on the image, --rm flag is to remove the container after usage so it doesn't take up to much space (doesn't remove the image)

```
docker run --rm -ti docker_image software
```
This is to access an image, -ti is for an interactive session. 

#### To push an image to docker hub

```
docker login (will be prompted for user and pass)
```
It will be prompted for user and pass

```
docker tag my_image username/my_image:latest
```
This is to tag the image with the username

```
docker push username/my_image:latest
```

This will push the image to the repo. `NB` if the doesn't exist it'll get created. If i create the repo before it has to have the same name of the image, otherwise the push will create a new repo.

```
docker rmi andreamariani/my_image:latest
```

`rmi` stand for remove image, to delete the duplicate.


### Singularity

```
singularity pull output_file docker://user/image:tag
```
`pull` is the command, `output_file` sets the name of the file and `docker` is to specify the type of image i'm downloading, other wise i'll look at a singularity repo. 
I probabily need to create a docker hub to find the container and pull it with singularity.
