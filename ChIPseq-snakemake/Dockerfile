FROM continuumio/miniconda3

LABEL "Andrea Mariani" andrea.mariani@ieo.it

RUN apt-get update && \
	apt-get install -y samtools=1.10

RUN apt-get install -y bowtie

RUN apt-get install -y macs2
