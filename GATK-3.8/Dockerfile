FROM broadinstitute/gatk3:3.8-0

# ~~~~~ BASIC SETUP ~~~~~ #
# mount point for for NYULMC phoenix (Singluarity)
RUN mkdir /ifs

# location for misc data
RUN mkdir /data

# location for misc scripts
RUN mkdir /opt/bin
ENV PATH="/opt/bin:/opt:${PATH}"

# GATK shortcut script
ADD gatk.sh /usr/gatk.sh
RUN chmod +x /usr/gatk.sh
ENV PATH="/usr:${PATH}"
