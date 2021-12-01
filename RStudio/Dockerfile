FROM bioconductor/bioconductor_docker

RUN apt-get update \
&& apt-get install -y \
curl \
wget \
libboost-all-dev \
libudunits2-dev \
gawk

# Install miniconda
RUN wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh \
&& bash Miniconda2-latest-Linux-x86_64.sh -b -p /opt/miniconda2 \
&& /opt/miniconda2/bin/conda config --add channels defaults \
&& /opt/miniconda2/bin/conda config --add channels conda-forge \
&& /opt/miniconda2/bin/conda config --add channels bioconda

# Install software required for chipseq pipeline with bioconda
# Force version of samtools to avoid error https://github.com/bioconda/bioconda-recipes/issues/13958
RUN /opt/miniconda2/bin/conda install -c bioconda \
samtools=1.10 \
bowtie \
macs2 \
preseq \
deeptools \
multiqc \
samblaster \
wiggletools \
pysam \
bedops \
r-spp \
ucsc-bedgraphtobigwig \
fastqc \
picard

# Install fastp manually because bioconda verison is not the latest
RUN wget http://opengene.org/fastp/fastp \
&& chmod a+x ./fastp \
&& mv ./fastp /usr/local/bin

# bioconductor
RUN R --slave -e "BiocManager::install(c( \
        'org.Mm.eg.db', \
        'org.Hs.eg.db', \
        'TxDb.Mmusculus.UCSC.mm9.knownGene', \
        'TxDb.Mmusculus.UCSC.mm10.knownGene', \
        'TxDb.Hsapiens.UCSC.hg19.knownGene', \
        'TxDb.Hsapiens.UCSC.hg18.knownGene', \
        'ChIPseeker'))" 

# cran
RUN R --slave -e 'install.packages(c( \
        "data.table", \
        "ggplot2", \
        "RColorBrewer", \
        "devtools", \
        "spp"), \
        repos="https://cloud.r-project.org/")'

# Update path
ENV PATH "/opt/miniconda2/bin:$PATH"
ENV PATH "/usr/local/bin:$PATH"