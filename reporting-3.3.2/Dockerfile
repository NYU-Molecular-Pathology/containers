FROM ubuntu:16.04

MAINTAINER Stephen M. Kelly

# ~~~~~ BASIC SETUP ~~~~~ #
RUN apt-get update && \
apt-get install -y wget \
bzip2 \
make \
rsync \
libcairo2-dev

# ~~~~~ MINICONDA ~~~~~ #
RUN wget https://repo.continuum.io/miniconda/Miniconda3-4.4.10-Linux-x86_64.sh && \
bash Miniconda3-4.4.10-Linux-x86_64.sh -b -p /conda && \
rm -f Miniconda3-4.4.10-Linux-x86_64.sh
ENV PATH="/conda/bin:${PATH}"

# ~~~~~ R ~~~~~ #
RUN conda install -y -c r \
r=3.3.2 \
r-base=3.3.2 \
pandoc=2.2.3.2 \
r-reshape2=1.4.2 \
r-knitr=1.15.1 \
r-rmarkdown=1.3 \
r-ggplot2=2.2.0 \
r-dt=0.2 \
r-gridextra=2.2.1 \
bioconda::r-plotly=4.5.6 \
bioconda::r-venndiagram=1.6.16
# conda-forge::r-plotly=4.7.1
# RUN conda install -y -c conda-forge r-plotly=4.7.1
