FROM ubuntu:16.04

MAINTAINER Stephen M. Kelly

# ~~~~~ BASIC SETUP ~~~~~ #
RUN apt-get update && \
apt-get install -y wget \
bzip2 \
make \
libcurl4-gnutls-dev \
libxml2-dev
# gcc \
# g++ \
# gfortran \
# libxml2-dev \
# libcairo2-dev
#
# ~~~~~ MINICONDA ~~~~~ #
RUN wget https://repo.continuum.io/miniconda/Miniconda3-4.4.10-Linux-x86_64.sh && \
bash Miniconda3-4.4.10-Linux-x86_64.sh -b -p /conda && \
rm -f Miniconda3-4.4.10-Linux-x86_64.sh
ENV PATH="/conda/bin:${PATH}"
RUN conda config --add channels conda-forge && \
conda config --add channels bioconda && \
conda config --add channels r

# ~~~~~ R ~~~~~ #
# RUN conda install -c conda-forge -c bioconda bioconductor-maftools
RUN conda install -c conda-forge -c r -c bioconda \
r=3.4.1 \
r-base=3.4.1
# bioconductor-bsgenome \
# bioconductor-genomicfeatures \
# bioconductor-variantannotation
# pandoc=2.2.3.2 \
# r-reshape2=1.4.3 \
# r-rmarkdown=1.8 \
# r-ggplot2=2.2.1 \
# r-knitr=1.18 \
# r-data.table=1.10.4
#
# ENV LC_ALL="C.UTF-8"
# ENV LANG="C.UTF-8"
RUN echo 'source("https://bioconductor.org/biocLite.R"); biocLite("maftools")' | R --vanilla
# http://bioconductor.org/packages/3.7/bioc/html/maftools.html
# http://bioconductor.org/packages/release/bioc/html/maftools.html
# https://github.com/PoisonAlien/maftools
# ERROR: dependencies 'GenomeInfoDb', 'GenomicRanges', 'rtracklayer', 'Rsamtools' are not available for package 'BSgenome'
# * removing '/conda/lib/R/library/BSgenome'
# ERROR: dependencies 'GenomeInfoDb', 'GenomicRanges', 'RMySQL', 'RCurl', 'rtracklayer', 'biomaRt' are not available for package 'GenomicFeatures'
# * removing '/conda/lib/R/library/GenomicFeatures'
# ERROR: dependencies 'GenomeInfoDb', 'GenomicRanges', 'SummarizedExperiment', 'Rsamtools', 'BSgenome', 'rtracklayer', 'GenomicFeatures' are not available for package 'VariantAnnotation'
# * removing '/conda/lib/R/library/VariantAnnotation'
# ERROR: dependencies 'VariantAnnotation', 'Rsamtools' are not available for package 'maftools'
# * removing '/conda/lib/R/library/maftools'
