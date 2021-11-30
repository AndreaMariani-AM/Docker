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
	gawk 

# Install miniconda2

RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
	&& bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3 \
	&& /opt/miniconda3/bin/conda config --add channels defaults \
	&& /opt/miniconda3/bin/conda config --add channels conda-forge \
	&& /opt/miniconda3/bin/conda config --add channels bioconda

# Install softwares that will be used for ChIPseq analysis
# WORKS: smatools, bowtie, macs2, preseq, multiqc, samblaster, wiggletools, bedops
# FUCK YOU packages: deeptools, pysam, r-spp(this one don't know if it just runs super long or doens't work), 
RUN /opt/miniconda3/bin/conda install -c bioconda \
# samtools=1.10 \
# bowtie \
# macs2 \
# preseq \
# deeptools \
# multiqc \
# samblaster \
# wiggletools \
# pysam \
# bedops \
# r-spp \
ucsc-bedgraphtobigwig \
fastqc
# picard

# Update path
ENV PATH "/opt/miniconda3/bin:$PATH"
