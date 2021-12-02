FROM bioconductor/bioconductor_docker

RUN apt-get update \
	&& apt-get install -y \
	## transfer data from or to servers
	curl \
	## non interactive network downloader, to download files
	wget \
	libboost-all-dev \
	## Boost C++ Libraries development files 
	libudunits2-dev \
	## The UDUNITS package supports units of physical quantities (e.g., meters, seconds).
	gawk \
	python3-pip

# Install miniconda3
# i changed the order of channels priority, before was defaults conda-forge and the bioconda but the officail website recommend this one  
# https://bioconda.github.io/user/install.html#set-up-channels
# conda 4.10 w/ pythone 3.9 has conflict problems, conda 4.10 w/ python 3.7 seems to work

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh \
	&& bash Miniconda3-py38_4.10.3-Linux-x86_64.sh -b -p /opt/miniconda3 \
	## /opt is the linux direcotry "reserved for the installation of add-on application software packages" aka any third party software 
	&& /opt/miniconda3/bin/conda config --add channels defaults \
	&& /opt/miniconda3/bin/conda config --add channels bioconda \
	&& /opt/miniconda3/bin/conda config --add channels conda-forge

# RUN pip3 install deeptools pysam \
# 	&& chmod a+x /usr/local/bin/deeptools \
# 	&& chmod a+x /usr/local/bin/pysam

# Install softwares that will be used for ChIPseq analysis.
# FUCK YOU packages: deeptools, pysam, r-spp(this one don't know if it just runs super long or doens't work)
RUN /opt/miniconda3/bin/conda install -c bioconda \
samtools=1.10 \
# bowtie \
# macs2 \
# preseq \
deeptools \
# multiqc \
# samblaster \
# wiggletools \
# pysam \
# bedops \
# r-spp \
# ucsc-bedgraphtobigwig \
# fastqc \
# picard



# Update path
ENV PATH "/opt/miniconda3/bin:$PATH"
