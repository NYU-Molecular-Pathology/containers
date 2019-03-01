FROM python:2.7-slim

RUN apt-get update && \
apt-get install -y --no-install-recommends \
g++ \
git \
wget && \
wget --quiet -O /opt/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
python /opt/get-pip.py && \
rm -rf /var/lib/apt/lists/* /opt/get-pip.py && \
pip install multiqc==1.5

CMD multiqc
