FROM rocker/rstudio:latest

##===========================================##===========================================##
# ENV are environment variables, and can be interpreted by the dockerfile. Seems like that this is discouraged cause it'll persist in the finale image, and it's always noninteractive
# it's set to avoid question/dialogs during the build (that can be ignored). The non interaction is set when zero interaction is required during the installation/update via apt.
# ENV DEBIAN_FRONTEND noninteractive
# What it seems to be recomended is to either avoid DEBIAN_FRONTEND or to use 
# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q packages, on the fly when required
# or even this, as will only available during the build
# ARG DEBIAN_FRONTEND=noninteractive
##===========================================##===========================================##

# ENV DEBIAN_FRONTEND noninteractive
ARG DEBIAN_FRONTEND=noninteractive
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

##===========================================##===========================================##
# COPY files into the RUN
##===========================================##===========================================##

COPY Makevars /root/.R/
COPY ccache.conf /root/.ccache

##===========================================##===========================================##
# Update and install system packages
#
# libcurl4-openssl-dev                   curl and RCurl (R package)
# libssl-dev                             openssl (R package)
# libcairo2-dev, libxt-dev               Cairo (R package)
# libxml2-dev                            XML and xml2 (R package)
# libudunits2-dev                        units (R package)
# libhdf5-dev                            hdf5r (R package)
# libv8-dev                              V8 (R package)
# libgdal-dev                            rgdal (R package)
# xorg, libx11-dev, libglu1-mesa-dev     Monocle 3 (R package)
# samtools libboost-all-dev              velocyto (R package)
# libgsl-dev                             gsl -> slingshot (R package)
# libbz2-dev                             Rsamtools (R package)
# libfftw3-dev                           heatmaps (R package)
# libglpk-dev                            FlowSOM (R package)
# libpoppler-cpp-dev                     pdftools (R package)
##===========================================##===========================================##

RUN apt-get --quiet update -y \
	&& apt-get --quiet upgrade -y \
	&& apt-get --quiet install -y \
	python-dev \
 #   python-pip \
    python3-dev \
    python3-pip \
    python3-tk \
    pandoc \
    libcurl4-openssl-dev \
    libssl-dev \
    libcairo2-dev \
    libxt-dev \
    libxml2-dev \
    libudunits2-dev \
    libhdf5-dev \
    libv8-dev \
    libgdal-dev \
    libglpk-dev \
    xorg \
    libx11-dev \
    libglu1-mesa-dev \
    libboost-all-dev \
    libgsl-dev \
    libbz2-dev \
    less \
    libmagick++-dev \
    ccache \
    libfftw3-dev \
    mysql-server \
  && rm -rf /var/lib/apt/lists/*


##===========================================##===========================================##
# Install Miniconda for Python 3.7 
# 
# Dani had problem with Python 3.8, but since some time has passed sinced the last build, i guess we can try it
##===========================================##===========================================##

RUN cd / \
	&& wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh \
	&& bash Miniconda3-py38_4.10.3-Linux-x86_64.sh -b -p /miniconda3 \
	&& /opt/miniconda3/bin/conda config --add channels defaults \
	&& /opt/miniconda3/bin/conda config --add channels bioconda \
	&& /opt/miniconda3/bin/conda config --add channels conda-forge

ENV PATH "$PATH:/miniconda3/bin"

##===========================================##===========================================##
## make Python 3.8 default because velocyto requires at least Python 3.6
## - set 'python' command to call Python 2.7
## - set 'python3' command to call Python 3.8
## - rm lsb_release because it prevents pip3 from working properly
##===========================================##===========================================##

RUN update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1 \
  && update-alternatives --install /usr/bin/python3 python3 /miniconda3/bin/python3.8 2 \
  && python --version \
  && python3 --version \
  && rm /usr/bin/lsb_release 


##----------------------------------------------------------------------------##
# install conda packages
##----------------------------------------------------------------------------##

RUN conda install --queit -y -c bioconda \
bedtools \
samtools \
deeptools \
&& conda install --quiet -y -c plotly plotly-orca