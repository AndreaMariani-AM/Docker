This is a file that contains notes on building Docker images and so on. The idea is to use Dokcer to "easily" build an image that's 100% reproducible
and the use singularity to pull it and use it in the HPC. for now i'll follow Arnaud tutorial here: https://web.microsoftstream.com/video/6bd1f122-29f5-4844-9c02-3fb4d5a7aa22 and then
i'll update it with more specific softwares i want to use for our pipelines.

Docker images can be used on local machines, with singularity i can use it on the cluster. This is because using docker requires you to be root user and that can't be on the HPC.

# Docker file

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


# Terminal CMDs

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