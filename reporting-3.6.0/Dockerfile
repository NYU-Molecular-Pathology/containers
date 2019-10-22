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
r=3.6.0 \
r-base=3.6.1 \
pandoc=2.2.3.2 \
r-reshape2=1.4.3 \
r-knitr=1.22 \
r-rmarkdown=1.12 \
r-ggplot2=3.1.1 \
r-dt=0.5 \
r-gridextra=2.3 \
conda-forge::r-plotly=4.9.0 \
conda-forge::r-venndiagram=1.6.20
