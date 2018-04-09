FROM stevekm/containers:base

# ~~~~~ BASIC SETUP ~~~~~ #
RUN apt-get update && \
\
apt-get install -y wget \
bzip2 \
gcc \
make \
zlib1g-dev \
libbz2-dev \
liblzma-dev

# ~~~~~ bcftools 1.7 ~~~~~ #
RUN cd /opt/ && \
wget https://github.com/samtools/bcftools/releases/download/1.7/bcftools-1.7.tar.bz2 && \
tar xvfj bcftools-1.7.tar.bz2 && \
rm -f bcftools-1.7.tar.bz2 && \
cd /opt/bcftools-1.7 && \
./configure && \
make && \
make install
ENV PATH="/opt/bcftools-1.7:${PATH}"
