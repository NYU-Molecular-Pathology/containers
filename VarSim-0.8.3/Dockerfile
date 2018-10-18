FROM ubuntu:16.04

MAINTAINER Stephen M. Kelly

# ~~~~~ BASIC SETUP ~~~~~ #
RUN apt-get update && \
apt-get install -y wget \
bzip2 \
python

# ~~~~~ MINICONDA ~~~~~ #
# RUN wget https://repo.continuum.io/miniconda/Miniconda2-4.4.10-Linux-x86_64.sh && \
# bash Miniconda2-4.4.10-Linux-x86_64.sh -b -p /conda && \
# rm -f Miniconda2-4.4.10-Linux-x86_64.sh
# ENV PATH="/conda/bin:${PATH}"
# # ~~~~~ SAMTOOLS ~~~~~ #
# RUN conda install -y -c bioconda -c conda-forge \
# samtools=1.7 \
# ncurses=6.1

# ~~~~~ VARSIM ~~~~~ #
# http://bioinform.github.io/varsim/
RUN cd /usr/local/bin && \
wget https://github.com/bioinform/varsim/releases/download/v0.8.3/varsim-0.8.3.tar.gz && \
tar -xzf varsim-0.8.3.tar.gz && \
rm -f varsim-0.8.3.tar.gz

RUN cd /usr/local/bin && \
mkdir samtools && \
cd samtools && \
wget http://sourceforge.net/projects/samtools/files/samtools/1.0/samtools-bcftools-htslib-1.0_x64-linux.tar.bz2 && \
tar xfj samtools-bcftools-htslib-1.0_x64-linux.tar.bz2 && \
rm -f samtools-bcftools-htslib-1.0_x64-linux.tar.bz2

RUN cd /usr/local/bin && \
mkdir ART && \
cd ART && \
wget http://www.niehs.nih.gov/research/resources/assets/docs/artbinvanillaicecream031114linux64tgz.tgz && \
tar xfz artbinvanillaicecream031114linux64tgz.tgz && \
rm -f artbinvanillaicecream031114linux64tgz.tgz
