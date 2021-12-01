FROM andreamariani/rnaseq

RUN apt-get update \
	&& apt-get install -y \
	## transfer data from or to servers
	curl


RUN /opt/miniconda3/bin/conda install -c bioconda \
samtools=1.10 \
bowtie \
macs2