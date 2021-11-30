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
	## remove packages in var/cache and var/lib to remove side-effects of apt-get update

# Install miniconda@

RUN wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh \
	&& bash Miniconda2-latest-Linux-x86_64.sh -b -p /opt/miniconda2 \
	&& /opt/miniconda2/bin/conda config --add channels defaults \
	&& /opt/miniconda2/bin/conda config --add channels conda-forge \
	&& /opt/miniconda2/bin/conda config --add channels bioconda

# Install softwares that will be used for ChIPseq analysis
RUN /opt/miniconda2/bin/conda install -c bioconda \
samtools=1.10 \
bowtie \
macs2 \
deeptools \
picard \
preseq \
multiqc \
samblaster \
wiggletools \
pysam \
bedops \
r-spp \
ucsc-bedgraphtobigwig \
fastqc 

# I have to install fastp manually 'cause bioconda won't install the latest version
RUN wget http://opengene.org/fastp/fastp \
## making it executable, "a" means all users access to the file will be change, "x" who has access can execute it/search for directoris.
&& chmod a+x ./fastp \
&& mv ./fastp /usr/local/bin

# Bioconductor packages
RUN R --slave -e "BiocManager::install(c( \
## slave tag is to make R run as quietly as possbile when it's a subprocess
## "e" Use expression as an input line, has to be quoted
		'org.Mm.eg.db', \
		'org.Hs.eg.db', \
		'TxDb.Mmusculus.UCSC.mm9.knownGene', \
        'TxDb.Mmusculus.UCSC.mm10.knownGene', \
        'TxDb.Hsapiens.UCSC.hg19.knownGene', \
        'TxDb.Hsapiens.UCSC.hg18.knownGene', \
		'ChIPSeeker'))"

# Cran packages
RUN R --slave -e 'install.packages(c( \
        "data.table", \
        "ggplot2", \
        "RColorBrewer", \
        "devtools", \
        "spp"), \
        repos="https://cloud.r-project.org/")'

# Update path for miniconda2 and fastp
ENV PATH "/opt/miniconda2/bin:$PATH"
ENV PATH "/usr/local/bin:$PATH"

