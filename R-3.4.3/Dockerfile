FROM ubuntu:16.04

MAINTAINER Stephen M. Kelly

# ~~~~~ BASIC SETUP ~~~~~ #
RUN apt-get update && \
apt-get install -y wget \
bzip2 \
make \
gcc \
g++ \
gfortran \
libxml2-dev \
libcairo2-dev

# ~~~~~ MINICONDA ~~~~~ #
RUN wget https://repo.continuum.io/miniconda/Miniconda3-4.4.10-Linux-x86_64.sh && \
bash Miniconda3-4.4.10-Linux-x86_64.sh -b -p /conda && \
rm -f Miniconda3-4.4.10-Linux-x86_64.sh
ENV PATH="/conda/bin:${PATH}"
RUN conda config --add channels defaults && \
conda config --add channels bioconda && \
conda config --add channels r

# ~~~~~ R ~~~~~ #
RUN conda install -y -c r r-base=3.4.3 \
r=3.4.3 \
pandoc=2.2.3.2 \
r-reshape2=1.4.3 \
r-rmarkdown=1.8 \
r-ggplot2=2.2.1 \
r-knitr=1.18 \
r-data.table=1.10.4 

ENV LC_ALL="C.UTF-8"
ENV LANG="C.UTF-8"
